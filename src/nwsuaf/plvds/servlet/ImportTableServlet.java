package nwsuaf.plvds.servlet;

import java.io.*;
import java.util.*;
import java.util.Map.Entry;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.Cell;
import jxl.CellType;
import jxl.Sheet;
import jxl.Workbook;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import nwsuaf.plvds.service.DataOperation;
import nwsuaf.plvds.util.ExcelImport;
import nwsuaf.plvds.util.XLSXCovertCSVReader;

public class ImportTableServlet extends HttpServlet {
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
		String tempPath = context.getRealPath("attach");
		
		try {
			DiskFileItemFactory diskFactory = new DiskFileItemFactory();  
            diskFactory.setSizeThreshold(4 * 1024);
            diskFactory.setRepository(new File(tempPath));
			ServletFileUpload upload = new ServletFileUpload(diskFactory);
			upload.setHeaderEncoding("UTF-8");
            upload.setSizeMax(500*1024*1024);
            
            List fileItems = upload.parseRequest(req);
            FileItem fieldItem1 = (FileItem)fileItems.get(0);
            String table = new String(fieldItem1.getString().getBytes("ISO-8859-1"),"utf-8");
            
            FileItem fileItem = (FileItem)fileItems.get(1);
            
            FileItem fieldItem2 = (FileItem)fileItems.get(2);
            int startRow = Integer.parseInt(fieldItem2.getString());
            
            processUploadFile(fileItem,table, startRow, req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
    private void processUploadFile(FileItem item, String table, int start,
    		HttpServletRequest req, HttpServletResponse resp) {  
        String filename = item.getName();
        
        int index = filename.lastIndexOf("\\");
        filename = filename.substring(index + 1, filename.length());
        long fileSize = item.getSize();
        if("".equals(filename) && fileSize == 0){        
            System.out.println("文件名为空 ...");
            return;
        }
 
        try {
        	DataOperation don = new DataOperation();
        	List<String> columns = don.getColumnName(table);
//			System.out.println(table+"中的字段数："+columns.size());
//        	
//			Workbook book = Workbook.getWorkbook(item.getInputStream());
//			Sheet sheet = book.getSheet(0);
//			int trows = sheet.getRows();
//			System.out.println(trows-start+1);
//			
//			for(int i=start-1;i<trows;i++){
//				Cell[] cells = sheet.getRow(i);
//				System.out.println("文件"+filename+"中的列数："+cells.length);
//				Map<String,Object> tmp = new HashMap<String,Object>();
//				for(int j=0;j<cells.length;j++){
//					CellType type = cells[j].getType();
//					System.out.print(type + ",");
//					
//					if(type == CellType.NUMBER){
//						tmp.put(columns.get(j), Double.parseDouble(cells[j].getContents()));
//					} else if(type == CellType.EMPTY){
//						tmp.put(columns.get(j), null);
//					} else {
//						String cont = cells[j].getContents();
//						if(cont == null || cont.equals("")){
//							tmp.put(columns.get(j), null);
//						} else {
//							tmp.put(columns.get(j), cont);
//						}
//					}
//				}
//				System.out.println();
//				
//				if(table.equals("jbqkb")){
//					tmp.put("cjr", req.getSession().getAttribute("username"));
//				}
//				don.add(table, tmp);
//			}
//			book.close();
//			ExcelImport xls = new ExcelImport();
//			List<Map<String, Object>> data = xls.getData(item.getInputStream(), filename, columns);
//			for(Map<String,Object> map:data){
//				if(table.equals("jbqkb")){
//					map.put("cjr", req.getSession().getAttribute("username"));
//				}
//				don.add(table, map);
//			}
        	List<Map<String,Object>> list = XLSXCovertCSVReader  
                    .readerExcel( 
                    		item.getInputStream(),  
                            "Sheet1", 30,columns);
        	int nm = 1;
            for (Map<String,Object> record : list) {
            	if(nm++ <= start)continue;
            	if(table.equals("jbqkb")){
            		record.put("cjr", req.getSession().getAttribute("username"));
				}
            	try{
            		don.add(table, record);
            	}
            	catch (Exception e) {}
            }
			resp.getWriter().write("{\"status\":\"Y\",\"info\":\"已成功插入"+(list.size()-start+1)+"条记录。\"}");
		} catch (Exception e) {
			try {
				resp.getWriter().write("{\"status\":\"N\",\"info\":\"上传的文件格式有误。\"}");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			item.delete();
		}
    }
}
