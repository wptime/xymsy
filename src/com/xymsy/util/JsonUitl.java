package com.xymsy.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;

public class JsonUitl {
	public static String sentJsonString(Object o) {
		System.out.println("jinjinjinjini");
		String jsonString = JSON.toJSONString(o,true);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain; charset=UTF-8");

		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;
		try {
	
		   out = response.getWriter();
		
		    out.print(jsonString);
			
		} catch (IOException e) {
			System.out.println("cacacacacaac");
			e.printStackTrace();
		}finally{
			out.flush();
			out.close();
		}

		return jsonString;
	}

	public static String sentString(String str) {

		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain; charset=UTF-8");

		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;
		try {
	
		   out = response.getWriter();
		
		    out.print(str);
			
		} catch (IOException e) {

			e.printStackTrace();
		}finally{
			out.flush();
			out.close();
		}
		return null;
	}

}
