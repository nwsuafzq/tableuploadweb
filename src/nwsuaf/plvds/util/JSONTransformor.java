package nwsuaf.plvds.util;

import java.util.*;



public class JSONTransformor {
	
	public static String transform(List<Map<String,Object>> list,int total){
		String strArr = "";
		strArr = "{\"total\":\"" + total + "\",";
		strArr += "\"list\":[";
		for(int i=0;i<list.size();i++){
			Map<String,Object> map = list.get(i);
			strArr += "{";
			String tmp = "";
			for(String key : map.keySet()){
				tmp += ("\""+key+"\"");
				tmp += (":");
				tmp += ("\"" + map.get(key) + "\"");
				tmp += (",");
			}
			tmp = tmp.substring(0,tmp.length()-1);
			strArr += tmp;
			if(i == list.size()-1) strArr += "}";
			else strArr += "},";
		}
		strArr += "]}";
		return strArr;
	}
}
