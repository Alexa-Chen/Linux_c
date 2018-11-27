package com.chenmo;

import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class SearchServlet extends HttpServlet {

    static List<String> datas = new ArrayList<String>();
    static {
        datas.add("ajax");
        datas.add("ajaxboot");
        datas.add("becky");
        datas.add("bill");
        datas.add("jemes");
        datas.add("jerry");

    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
       // System.out.println("123");

        String keyword = req.getParameter("keyword");
        System.out.println("keyword++++==="+keyword);
      //  System.out.println("456");
        List<String> listData = getData(keyword);
       // System.out.println("789");
        System.out.println("json ==" + JSONArray.fromObject(listData));

        resp.getWriter().write(JSONArray.fromObject(listData).toString());

    }
    public List<String> getData(String keyword){

        List<String> list = new ArrayList<String>();
        for (String data:datas){
            if (data.contains(keyword)){
                list.add(data);
            }
          //  System.out.println(data);
        }
        return list;
    }
}
