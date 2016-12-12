package nwsuaf.plvds.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DataOperation {
	public Connection con = DataSource.getConnection();
	
	public Map<String,Object> getById(String table, String key, String id) throws Exception {
		String sql = "select * from "+table+" where "+key+"=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		
		ResultSet rs = ps.executeQuery();
		Map<String,Object> map = new HashMap<String,Object>();
		while(rs.next()){
			ResultSetMetaData rsmd = rs.getMetaData();
			int count = rsmd.getColumnCount();
			for(int i=1;i<=count;i++){
				String columnName = rsmd.getColumnName(i);
				String fchar = columnName.charAt(0) + "";
				if(fchar.matches("\\d")){
					columnName  = "_" + columnName;
				}
				map.put(columnName, rs.getObject(i));
			}
		}
		return map;
	}
	public List<Map<String,Object>> getByFilter(String table,String filter,String orderBy,String orderType,
			String page,String mainTable) throws Exception {
		StringBuffer sb = new StringBuffer("");
		if(mainTable != null){
			sb.append("select " + mainTable + ".* from " + table);
		} else {
			sb.append("select * from " + table);
		}
		
		if(filter != null){
			sb.append(" where " + filter);
		}
		if(orderBy != null){
			sb.append(" order by " + orderBy + " " + orderType);
		}
		if(page != null){
			sb.append(" limit " + page + ",10");
		}
		String sql = sb.toString();
		System.out.println(sql);
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		while(rs.next()){
			Map<String,Object> map = new HashMap<String,Object>();
			
			ResultSetMetaData rsmd = rs.getMetaData();
			int count = rsmd.getColumnCount();
			for(int i=1;i<=count;i++){
				String columnName = rsmd.getColumnName(i);
				String fchar = columnName.charAt(0) + "";
				if(fchar.matches("\\d")){
					columnName  = "_" + columnName;
				}
				if(rs.getObject(i) == null){
					map.put(columnName, "");
				} else {
					map.put(columnName, rs.getObject(i));
				}
			}
			list.add(map);
		}
		return list;
	}
	
	public boolean add(String table,Map<String,Object> entity) throws Exception {
		String columns = "",columnsVal = "";

		for(String key : entity.keySet()) {
			columns += (key+",");
			Object obj = entity.get(key);
			if(obj == null){
				columnsVal += "null,";
			} else {
				String dataType = obj.getClass().getName();
				if(dataType == "java.lang.String"){
					if(obj.toString().startsWith("\"")){
						columnsVal += obj+",";
					}
					else{
						columnsVal += "'"+obj+"',";
					}
				} else {
					columnsVal += obj+",";
				}
			}
		}
		columns = columns.substring(0, columns.length()-1);
		columnsVal = columnsVal.substring(0, columnsVal.length()-1);
		String sql = "insert into "+table+"("+columns+") values("+columnsVal+")";
		System.out.println("addsql:"+sql);
		PreparedStatement ps = con.prepareStatement(sql);
		return ps.execute();
	}
	public void update(String table, String where, String column,
			String value) throws Exception {
		String sql = "update " + table + " set " + column + "='" + value + "' where " + where;
		PreparedStatement ps = con.prepareStatement(sql);
		ps.executeUpdate();
	}
	public List<String> getColumnName(String table) throws Exception {
		List<String> list = new ArrayList<String>();
		String sql = "select * from " + table + " where 1=2";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		ResultSetMetaData rsmd = rs.getMetaData();
		int count = rsmd.getColumnCount();
		for(int i=1;i<=count;i++){
			String columnName = rsmd.getColumnName(i);
			System.out.print(columnName + ",");
			list.add(columnName);
		}
		return list;
	}
	public boolean delete(String table, String filter) throws Exception {
		String sql = "delete from " + table;
		if(filter != null)
			sql += (" where "+filter);
		System.out.println("delsql:"+sql);
		PreparedStatement ps = con.prepareStatement(sql);
		return ps.execute();
	}
}
