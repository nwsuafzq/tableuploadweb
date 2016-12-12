package nwsuaf.plvds.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import nwsuaf.plvds.service.DataOperation;

public class AddUserServlet extends HttpServlet {
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
		String usertype = req.getParameter("usertype");
		String belteacher = req.getParameter("belteacher");
		
		DataOperation don = new DataOperation();
		try {
			Map<String,Object> entity = new HashMap<String,Object>();
			entity.put("yhm", username);
			entity.put("sf", usertype);
			entity.put("mm", "123456");
			entity.put("ssjs", belteacher);
			don.add("yhb", entity);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
