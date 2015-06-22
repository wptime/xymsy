package com.xymsy.util;

/**
 * 
 * @author Administrator
 * 
 */
public class ServiceResult {

	private String msg;
	private Object obj;

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getObj() {
		return obj;
	}

	public void setObj(Object obj) {
		this.obj = obj;
	}

	public ServiceResult() {//无参构造方法
		msg = "noOperation";
		this.obj = null;
	}

	public ServiceResult(String msg, Object obj) {

		this.msg = msg;
		this.obj = obj;
	}

}
