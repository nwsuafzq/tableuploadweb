package nwsuaf.plvds.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import nwsuaf.plvds.service.DataOperation;

public class ChangePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String originpwd = req.getParameter("originpwd");
		String password = req.getParameter("password");
		DataOperation don = new DataOperation();
		try {
			HttpSession session = req.getSession();
			String username = (String)session.getAttribute("username");
			Map<String,Object> map = don.getById("yhb", "yhm", username);
			String dpwd = (String)map.get("mm");
			if(dpwd.equals(originpwd)){
				don.update("yhb", "yhm='"+username+"'", "mm", password);
				resp.getWriter().write("true");;
			} else {
				resp.getWriter().write("false");;
			}
		} catch(Exception e){
			e.printStackTrace();
		}
	}
}
