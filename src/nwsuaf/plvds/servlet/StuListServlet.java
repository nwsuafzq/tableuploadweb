package nwsuaf.plvds.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import nwsuaf.plvds.service.DataOperation;
import nwsuaf.plvds.util.JSONTransformor;

public class StuListServlet extends HttpServlet {
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
		
		DataOperation don = new DataOperation();
		try {
			String tname = (String)req.getSession().getAttribute("username");
			int pageno = (Integer.parseInt(page)-1)*10;
			List<Map<String,Object>> list = don.getByFilter("yhb","sf='S' AND ssjs='"+tname+"'",null,null,String.valueOf(pageno),null);
			List<Map<String,Object>> tlist = don.getByFilter("yhb","sf='S' AND ssjs='"+tname+"'", null, null, null,null);
			
			resp.setContentType("text/json");
			resp.setCharacterEncoding("UTF-8");
			
			PrintWriter pw = resp.getWriter();
			int pageNum = (int)Math.ceil(tlist.size()/10.0F);
			pw.write(JSONTransformor.transform(list,pageNum));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
