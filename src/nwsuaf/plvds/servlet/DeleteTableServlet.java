package nwsuaf.plvds.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.exceptions.MySQLSyntaxErrorException;

import nwsuaf.plvds.service.DataOperation;

public class DeleteTableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/json");
		resp.setCharacterEncoding("UTF-8");
		
		String table = req.getParameter("table");
		String year = req.getParameter("year");
		
		DataOperation don = new DataOperation();
		try {
			HttpSession session = req.getSession();
			String tname = (String)session.getAttribute("username");
			String usertype = (String)session.getAttribute("usertype");
			
			String where = "";
			
			if(table.equals("qxsjb")){
				where = "synd='"+year+"'";
				don.delete(table, where);
				return;
			}
			
			if(table.equals("jbqkb") || table.equals("cstrwlsj")
					|| table.equals("clmsb") || table.equals("ghsjb")){
				if(table.equals("jbqkb")){
					if(usertype.equals("I")){
						where = "1=1";
					} else if(usertype.equals("T")){
						where = "cjr in (select yhm from yhb where cjr=yhm and ssjs='"+tname+"')";
					} else {
						where = "cjr='"+tname+"'";
					}
				} else {
					if(usertype.equals("I")){
						where = "1=1";
					} else if(usertype.equals("T")){
						where = "sybm in (select sybm from jbqkb,yhb where cjr=yhm and ssjs='"+tname+"')";
					} else {
						where = "sybm in (select sybm from jbqkb where cjr='"+tname+"')";
					}
				}
			} else {
				if(usertype.equals("I")){
					where = "synd='"+year+"'";
				} else if(usertype.equals("T")){
					where = "synd='"+year+"' and sybm in (select sybm from jbqkb,yhb where cjr=yhm and yhm='"+tname+"')";
				} else {
					where = "synd='"+year+"' and sybm in (select sybm from jbqkb where cjr='"+tname+"')";
				}
			}
			don.delete(table, where);
			
			PrintWriter pw = resp.getWriter();
			pw.write("{\"status\":\"Y\",\"info\":\"删除成功\"}");
		} catch(MySQLSyntaxErrorException e) {
			System.out.println(e.getMessage());
			PrintWriter pw = resp.getWriter();
			pw.write("{\"info\":\"删除失败,可能该表中不存在[试验年度]字段\"}");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
