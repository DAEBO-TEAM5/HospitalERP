package hospital.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.ItemDao;
import hospital.vo.ItemVO;

public class ItemDelServiceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		 InputStream inputStream = null; ;
		   BufferedReader br = null;
		   StringBuilder sb = new StringBuilder();
	        try {
	        	inputStream = request.getInputStream();
	            if (inputStream != null) {
	                br = new BufferedReader(new InputStreamReader(inputStream));
	                char[] charBuffer = new char[128];
	                int bytesRead = -1;
	                while ((bytesRead = br.read(charBuffer)) > 0) {
	                    sb.append(charBuffer, 0, bytesRead);
	                }
	            }
	        } catch (IOException ex) {
	            ex.printStackTrace();
	        } finally {
	            if (br != null) {
	                try {
	                    br.close();
	                } catch (IOException ex) {
	                    ex.printStackTrace();;
	                }
	            }
	            if (inputStream != null) {
	                try {
	                    inputStream.close();
	                } catch (IOException ex) {
	                    ex.printStackTrace();
	                }
	            }
	        }
	        String jsonStr = sb.toString();
	        JSONParser parser = new JSONParser();
	        try {
	            JSONArray array = (JSONArray) parser.parse(jsonStr);
	            List<ItemVO> itemList = new ArrayList<>();
	            for (int i = 0; i < array.size(); i++) {
	                JSONObject item = (JSONObject) array.get(i);
	                ItemVO itemVO = new ItemVO();
	                itemVO.setI_code(Integer.parseInt((String) item.get("iCode")));
	                itemList.add(itemVO);
	            }
	            System.out.println(itemList);
	            ItemDao dao;
	            try {
	                dao = new ItemDao();
	                ArrayList<ItemVO> list = dao.itemDelete(itemList);
	                
	                JSONObject sendObject = new JSONObject();
	                JSONArray sendArray = new JSONArray();
	                JSONObject jobj = null;
	                for (int i = 0; i < list.size(); i++) {
	                    jobj = new JSONObject();
	                    jobj.put("i_num", list.get(i).getI_num());
	                    sendArray.add(jobj);
	                }
	                sendObject.put("itemList", sendArray);
	                
	                response.setContentType("application/json; charset=utf-8");
	                response.getWriter().print(sendObject);
	                
	                
	            } catch (Exception e) {
	                e.printStackTrace();
	                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500 Internal Server Error
	            }
	        } catch (ParseException e) {
	            e.printStackTrace();
	            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500 Internal Server Error
	        }

	       return null;
	   }     

}
