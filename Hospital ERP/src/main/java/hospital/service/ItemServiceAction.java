package hospital.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import hospital.action.Action;
import hospital.action.ActionForward;
import hospital.dao.ItemDao;
import hospital.vo.ItemVO;

public class ItemServiceAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
      ActionForward forward = null;
      System.out.println("여기는 item service action");
      ItemDao dao = null;
      try {
         dao = new ItemDao();
      } catch (Exception e) {
         e.printStackTrace();
      }
      ArrayList<ItemVO> list = new ArrayList<>();
      list = dao.itemTable();   
      JSONObject sendObject = new JSONObject();
      JSONArray sendArray = new JSONArray();
      JSONObject jobj = null;
      for(int i =0; i < list.size(); i++) {
         jobj = new JSONObject();
         jobj.put("i_num", list.get(i).getI_num());
         jobj.put("i_name", list.get(i).getI_name());
         jobj.put("i_code", list.get(i).getI_code());
         jobj.put("i_category", list.get(i).getI_category());
         jobj.put("i_unit", list.get(i).getI_unit());
         jobj.put("i_stock", list.get(i).getI_stock());
         jobj.put("i_expire", list.get(i).getI_expire());
         jobj.put("i_price", list.get(i).getI_price());
         jobj.put("i_remark", list.get(i).getI_remark());
         
         sendArray.add(jobj);
      }
      sendObject.put("item", sendArray);
      try {
         response.setContentType("application/text; charset=utf-8");
         response.getWriter().print(sendObject);
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
   return null;
   }

}