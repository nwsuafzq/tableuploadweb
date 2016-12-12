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

public class TeacherListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		DataOperation don = new DataOperation();
		try {
			List<Map<String,Object>> list = don.getByFilter("yhb","sf='T'",null,null,null,null);
			
			resp.setContentType("text/json");
			resp.setCharacterEncoding("UTF-8");
			
			PrintWriter pw = resp.getWriter();
			pw.write("{\"tlist\":[");
			for(int i=0;i<list.size();i++){
				Map<String,Object> map = list.get(i);
				if(i == list.size()-1)
					pw.write("\""+(String)map.get("yhm")+"\"");
				else
					pw.write("\""+(String)map.get("yhm")+"\",");
			}
			pw.write("]}");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
