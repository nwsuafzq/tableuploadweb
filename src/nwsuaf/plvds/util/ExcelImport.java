package nwsuaf.plvds.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 * Excel导入，支持xls及xlsx
 * 
 * @author Administrator
 * 
 */
public class ExcelImport {
	public static final String EMPTY = "";
	public static final String POINT = ".";

	public List<Map<String, Object>> getData(InputStream stream, String fileName,List<String> columns) throws Exception {
		String ext = getPostfix(fileName);
		if("xls".equals(ext)){
			return xls(stream,columns);
		}
		else if("xlsx".equals(ext)){
			return xlsx(stream,columns);
		}
		else{
			throw new Exception("文件类型不正确");
		}
	}

	/**
	 * 读取xls文件
	 * @param stream
	 * @param columns
	 * @return
	 * @throws IOException
	 */
	private List<Map<String, Object>> xls(InputStream stream,List<String> columns) throws IOException {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		HSSFWorkbook hssfWorkbook = new HSSFWorkbook(stream);
		HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(0);
		for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
			HSSFRow hssfRow = hssfSheet.getRow(rowNum);
			
			if (hssfRow != null) {
				Map<String, Object> map = new HashMap<String, Object>();
				int cellNum = hssfRow.getLastCellNum();
				for(int j=0;j<=cellNum;j++){
					HSSFCell cell = hssfRow.getCell(j);
					 CellType type = cell.getCellTypeEnum();
					 if(type == CellType.NUMERIC){
						 map.put(columns.get(j), cell.getNumericCellValue());
					 }
					 else if(type == CellType.STRING){
						 map.put(columns.get(j), cell.getStringCellValue());
					 }
					 else{
						 map.put(columns.get(j), null);
					 }
				}
				list.add(map);
			}
		}
		return list;
	}

	/**
	 * 读取xlsx
	 * @param stream
	 * @param columns
	 * @return
	 * @throws IOException 
	 */
	private List<Map<String, Object>> xlsx(InputStream stream,List<String> columns) throws IOException {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		

		XSSFWorkbook xssfWorkbook = new XSSFWorkbook(stream);
		XSSFSheet xssfSheet = xssfWorkbook.getSheetAt(0);
		
		for (int rowNum = 1; rowNum <= xssfSheet.getLastRowNum(); rowNum++){
			XSSFRow row = xssfSheet.getRow(rowNum);
			if(row != null){
				Map<String, Object> map = new HashMap<String, Object>();
				int cellNum = row.getLastCellNum();
				for(int j=0;j<=cellNum;j++){
					XSSFCell cell = row.getCell(j);
					CellType type = cell.getCellTypeEnum();
					 if(type == CellType.NUMERIC){
						 map.put(columns.get(j), cell.getNumericCellValue());
					 }
					 else if(type == CellType.STRING){
						 map.put(columns.get(j), cell.getStringCellValue());
					 }
					 else{
						 map.put(columns.get(j), null);
					 }
				}
				list.add(map);
			}
		}
		return list;
	}

	/**
	 * 获取扩展名
	 * 
	 * @param path
	 * @return
	 */
	private String getPostfix(String path) {
		if (path == null || EMPTY.equals(path.trim())) {
			return EMPTY;
		}
		if (path.contains(POINT)) {
			return path.substring(path.lastIndexOf(POINT) + 1, path.length());
		}
		return EMPTY;
	}
}
