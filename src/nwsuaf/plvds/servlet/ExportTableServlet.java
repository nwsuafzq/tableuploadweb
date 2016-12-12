package nwsuaf.plvds.servlet;

import java.io.*;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import nwsuaf.plvds.service.DataOperation;

public class ExportTableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		ServletContext context = req.getServletContext();
		String tmpPath = context.getRealPath("areatmp");
		
		String table = req.getParameter("table");
		String filter = req.getParameter("filter");
		String filterval = req.getParameter("filterval");
		
		String oriTable = table;
		
		DataOperation don = new DataOperation();
		try {
			String filename = tmpPath + File.separator + table + System.currentTimeMillis() + ".xls";
			File file = new File(filename);
			WritableWorkbook book = Workbook.createWorkbook(file);
			//生成名为table的工作表，参数0表示这是第一页
			WritableSheet sheet = book.createSheet(table,0);
			//在Label对象的构造子中指名单元格位置是第一列第一行(0,0) 
			
			List<String> columns = don.getColumnName(table);
			int row = 0;
			for(int i=0;i<columns.size();i++){
				Label lbl = new Label(i,row,columns.get(i));
				sheet.addCell(lbl);
			}
			HttpSession session = req.getSession();
			String tname = (String)session.getAttribute("username");
			String usertype = (String)session.getAttribute("usertype");
			String where = "";
			if(usertype.equals("I")){
				table += " A";
				where = "1=1";
			} else if(usertype.equals("T")){
				if(table.equals("jbqkb")){
					table += " A";
					where = "cjr in (select yhm from yhb where ssjs='"+tname+"')";
				} else {
					table += " A,jbqkb B";
					where = "A.sybm=B.sybm AND cjr in (select yhm from yhb where ssjs='"+tname+"')";
				}
			} else {
				if(table.equals("jbqkb")){
					table += " A";
					where = "cjr='"+tname+"'";
				} else {
					table += " A,jbqkb B";
					where = "A.sybm=B.sybm AND cjr='"+tname+"'";
				}
			}
			if(filter != null && filterval != null && !filter.equals("") && !filterval.equals("")){
				where += " AND " + filter + " like '%" + filterval + "%'";
			}
			
			if(oriTable.equals("qxsjb")){
				table = "qxsjb A";
				where = "1=1";
			}
			
			List<Map<String,Object>> list = don.getByFilter(table,where,null,null,null,"A");
			for(int i=0;i<list.size();i++){
				++row;
				Map<String,Object> map = list.get(i);
				for(int j=0;j<columns.size();j++){
					Object obj = map.get(columns.get(j));
					if(obj != null){
						String type = obj.getClass().getName();
						if(type == "java.lang.String"){
							Label lbl = new Label(j,row,(String)obj);
							sheet.addCell(lbl);
						} else {
							double num = Double.parseDouble(String.valueOf(obj));
							jxl.write.Number lbl = new jxl.write.Number(j,row,num);
							sheet.addCell(lbl);
						}
					} else {
						Label lbl = new Label(j,row,null);
						sheet.addCell(lbl);
					}
				}
			}
			
			//写入数据并关闭文件 
			book.write();
			book.close();
			
			//response.setContentType("application/ms-excel;charset=UTF-8");
			resp.setContentType("application/octet-stream;charset=UTF-8");
			resp.setHeader("Content-Disposition", "attachment; filename=\"" + System.currentTimeMillis() + ".xls" + "\"");
			int len = (int)file.length();
			byte []buf = new byte[len];
			FileInputStream fis = new FileInputStream(file);
			OutputStream out = resp.getOutputStream();
			len = fis.read(buf);
			out.write(buf, 0, len);
			out.flush();
			fis.close();
			file.delete();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
