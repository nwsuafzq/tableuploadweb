package nwsuaf.plvds.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import nwsuaf.plvds.service.DataOperation;

public class InitPwdServlet extends HttpServlet {
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
		DataOperation don = new DataOperation();
		try {
			don.update("yhb","yhm='"+username+"'","mm","123456");
		} catch(Exception e){
			e.printStackTrace();
		}
	}
}
