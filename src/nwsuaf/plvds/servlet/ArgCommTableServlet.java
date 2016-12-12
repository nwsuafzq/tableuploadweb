package nwsuaf.plvds.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.exceptions.MySQLSyntaxErrorException;

import nwsuaf.plvds.service.DataOperation;
import nwsuaf.plvds.util.JSONTransformor;

public class ArgCommTableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String page = req.getParameter("page");
		String table = req.getParameter("table");
		String filter = req.getParameter("filter");
		String filterval = req.getParameter("filterval");
		
		DataOperation don = new DataOperation();
		String oritable = table;
		try {
			HttpSession session = req.getSession();
			String tname = (String)session.getAttribute("username");
			String usertype = (String)session.getAttribute("usertype");
			int pageno = (Integer.parseInt(page)-1)*10;
			
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
			if(oritable.equals("jbqkb") || oritable.equals("cstrwlsj")
					|| oritable.equals("clmsb") || oritable.equals("ghsjb")){
				where += " AND 2=2";
			} else if(oritable.equals("qxsjb")){
				table = "qxsjb A";
				where = "1=1";
			} else {
				if(filter != null && filterval != null && !filter.equals("") && !filterval.equals("")){
					where += " AND " + filter + " like '%" + filterval + "%'";
				}
			}
			
			List<Map<String,Object>> list = don.getByFilter(table,where,null,null,String.valueOf(pageno),"A");
			List<Map<String,Object>> tlist = don.getByFilter(table,where, null, null, null,"A");
			
			resp.setContentType("text/json");
			resp.setCharacterEncoding("UTF-8");
			
			PrintWriter pw = resp.getWriter();
			int pageNum = (int)Math.ceil(tlist.size()/10.0F);
			pw.write(JSONTransformor.transform(list,pageNum));
		} catch(MySQLSyntaxErrorException e) {
			System.out.println(e.getMessage());
			PrintWriter pw = resp.getWriter();
			pw.write("{\"error\":\"false\"}");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
