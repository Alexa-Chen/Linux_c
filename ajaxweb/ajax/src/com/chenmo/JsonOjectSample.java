package com.chenmo;

import net.sf.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class JsonOjectSample {
    public static void main(String[] args) {
        //JSONObject();
      //  createJsonMap();

        createBean();

    }

    /*
    * private String name;
    private int age;
    private boolean has;
    private Object car;
    private String[] mar
    *
    * */
    private static void createBean() {

        DIaoSI dIaoSI = new DIaoSI();
        dIaoSI.setName( "w" );
        dIaoSI.setAge( 24 );
        dIaoSI.setHas( false );
        dIaoSI.setCar( null );
        dIaoSI.setMar( new String[]{"aa","bb"} );

        System.out.println(JSONObject.fromObject( dIaoSI ));

    }


    private static void createJsonMap() {
      //  Object nil = null;
        Map<String,Object> wang = new HashMap<>();
        wang.put("name","wang");
        wang.put("age",25);
        wang.put("bri","2019-10-10");
        wang.put("sch","lan");
        wang.put("mar",new String[]{"lifa","wa"});
        wang.put("has",true);
        wang.put("car",null);

        JSONObject jsonObject = JSONObject.fromObject(wang);
        System.out.println(jsonObject);


    }

    private static void JSONObject() {
        JSONObject wang = new JSONObject();
        wang.put("name","wang");
        wang.put("age",25);
        wang.put("bri","2019-10-10");
        wang.put("sch","lan");
        wang.put("mar",new String[]{"lifa","wa"});
        wang.put("has",false);
        wang.put("car",null);
        System.out.println(wang.toString());
    }



}
