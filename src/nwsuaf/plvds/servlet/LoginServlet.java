package nwsuaf.plvds.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import nwsuaf.plvds.service.DataOperation;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String usertype = req.getParameter("usertype");
		
		DataOperation don = new DataOperation();
		try {
			Map<String,Object> map = don.getById("yhb", "yhm", username);
			PrintWriter pw = resp.getWriter();
			if(map.size() == 0){
				pw.write("{'status':'false'}");
			} else {
				String dps = (String)map.get("mm");
				String utype = (String)map.get("sf");
				if(dps.equals(password) == true && utype.equals(usertype) == true){
					HttpSession session = req.getSession();
					session.setAttribute("username", username);
					session.setAttribute("usertype", usertype);
					if(usertype.equals("I")){
						session.setAttribute("zntype", "超级用户");
					} else if(usertype.equals("T")){
						session.setAttribute("zntype", "教师");
					} else if(usertype.equals("S")){
						session.setAttribute("zntype", "学生");
					}
					pw.write("{'status':'true'}");
				} else {
					pw.write("{'status':'false'}");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
