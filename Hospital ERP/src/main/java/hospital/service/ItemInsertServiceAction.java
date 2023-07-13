package hospital.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Iterator;
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

public class ItemInsertServiceAction implements Action {


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
	                itemVO.setI_i_code(Integer.parseInt((String) item.get("itemCode")));
	                itemVO.setI_unit((String) item.get("itemUnit"));
	                itemVO.setI_stock(Integer.parseInt((String) item.get("itemStock")));
	                itemVO.setI_expire((String) item.get("itemExpire"));
	                itemVO.setI_price(Integer.parseInt((String) item.get("itemPrice")));
	                itemVO.setI_remark((String) item.get("itemRemark"));
	                itemList.add(itemVO);
	            }
	            
	            ItemDao dao;
	            try {
	                dao = new ItemDao();
	                ArrayList<ItemVO> list = dao.itemInsert(itemList);
	                
	                JSONObject sendObject = new JSONObject();
	                JSONArray sendArray = new JSONArray();
	                JSONObject jobj = null;
	                for (int i = 0; i < list.size(); i++) {
	                    jobj = new JSONObject();
	                    jobj.put("i_name", list.get(i).getI_name());
	                    jobj.put("i_category", list.get(i).getI_category());
	                    jobj.put("i_unit", list.get(i).getI_unit());
	                    jobj.put("i_stock", list.get(i).getI_stock());
	                    jobj.put("i_expire", list.get(i).getI_expire());
	                    jobj.put("i_price", list.get(i).getI_price());
	                    jobj.put("i_remark", list.get(i).getI_remark());
	                    
	                    sendArray.add(jobj);
	                }
	                sendObject.put("itemList", sendArray);
	                
	                response.setContentType("application/json; charset=utf-8");
	                response.getWriter().print(sendObject);
	                
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        } catch (ParseException e) {
	            e.printStackTrace();
	        }

	       return null;
	   }     
	        

	}

