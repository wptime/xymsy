package com.xymsy.actionImp;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.util.ServletContextAware;

import com.mysql.jdbc.jdbc2.optional.SuspendableXAConnection;
import com.xymsy.action.IPersonAction;
import com.xymsy.entity.Certification;
import com.xymsy.entity.Goods;
import com.xymsy.entity.Store;
import com.xymsy.entity.User;
import com.xymsy.serviceImp.FunctionService;
import com.xymsy.serviceImp.GoodsService;
import com.xymsy.util.PageMsg;
import com.xymsy.util.ServiceResult;

public class PersonAction implements IPersonAction, ServletRequestAware,
		ServletResponseAware, ServletContextAware, SessionAware {

	private ServletContext application;// Servlet上下文

	private HttpServletRequest request;// request对象
	private HttpServletResponse response;// response对象
	private HttpSession session;// session对象
	
	public String cerStatu;//实名认证状态：0:为提交申请,1:审核中,2:未通过,3审核通过
	public String storeStatu;//店铺状态：0:没有店铺,1:审核中,2:审核未通过,3:已有店铺

	/**************** 下***从页面上获取的信息 **********************/
	public String goodsName;
	public String goodsPrice;
	public String goodsSum;
	public String goodsBrief;
	public String goodsInfo;
	public List<File> photo;
	public List<String> photoFileName;
	public List<String> photoContentType;
	public List<String> title;
	
	public String realname;//【实名认证】
	public String school;//【实名认证】
	public String major;//【实名认证】
	public String number;//【实名认证】
	public String call;//【实名认证】
	public String grade;//【实名认证】
	
	public String storeName;//【申请开店】
	public String mainSell;//【申请开店】
	public String storeAdd;//【申请开店】
	public String storeBrief;//【申请开店】

	public List<Goods> storeGoodsList;

	public List<Goods> getStoreGoods() {
		return storeGoodsList;
	}

	public void setStoreGoods(List<Goods> storeGoodsList) {
		this.storeGoodsList = storeGoodsList;
	}

	/**************** 上***从页面上获取的信息 **********************/

	/**************** 下***serviceResource **************************/
	private GoodsService goodsService;
	private FunctionService functionService;

	@Resource
	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}
	
	@Resource
	public void setFunctionService(FunctionService functionService) {
		this.functionService = functionService;
	}

	/**************** 上***serviceResource **************************/

	public HttpSession getSession() {
		return ServletActionContext.getRequest().getSession(true);
	}

	@Override
	public void setServletContext(ServletContext application) {
		this.application = application;

	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;

	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;

	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub

	}

	/***************** 下***功能 *****************************/

	@Override
	public String addGoods() {
		String picturePath;
		int n = 0;
		int i;
		
		// return "addgoodsfail";
		session = getSession();
		User user = (User) session.getAttribute("user");
		Store store = (Store) session.getAttribute("store");
		if(user == null)
		{
			return "login";
		}
		if(store == null)
		{
			return "applyShop";
		}
		Goods goods = new Goods();
		System.out.println("goodsname:" + goodsName);
		System.out.println("goodsprice:" + goodsPrice);
		System.out.println("goodsnum:" + goodsSum);
		System.out.println("goodsbrief:" + goodsBrief);
		System.out.println("goodsinfo:" + goodsInfo);
		goodsName = goodsName + "";
		goodsPrice = goodsPrice + "";
		goodsSum += "";
		goodsBrief += "";
		goodsInfo += "";

		goods.setGdGoodsname(goodsName);
		goods.setGdBrief(goodsBrief);
		goods.setGdInfo(goodsInfo);
		goods.setGdTag("#");
		try {
			double tempprice = Double.parseDouble(goodsPrice);
			goods.setGdPrice(tempprice);
		} catch (NumberFormatException e) {
			System.out.println("商品价格格式化错误，自动转换为默认值0.01");
			goods.setGdPrice(0.01);
			goodsPrice = new String("0.01");
			return "addgoodsfail";
		}
		try {
			int tempsum = Integer.parseInt(goodsSum);
			goods.setGdSum(tempsum);
		} catch (NumberFormatException e) {
			System.out.println("商品库存量格式化错误，自动转换为默认值1");
			goodsSum = new String("1");
			goods.setGdSum(1);
			return "addgoodsfail";
		}
		
		goods.setStore(store);//添加商品-->商店外键
		
		String titleString = "#";
		if(title != null)
		{
			n = title.size();
			System.out.println(n);
		}
		for(i = 0; i < n; i++)
		{
			titleString = titleString + title.get(i) + "#";
			System.out.println(titleString);
		}
		goods.setGdTag(titleString);

		ServiceResult serviceResult = goodsService.addGoods(goods);

		n=0;
		if(photo != null)
		{
			n = photo.size();
			System.out.println("有" + n + "张图片");
		}
		for (i = 0; i < n; i++) 
		{
			System.out.println("文件：" + photo.get(i));
			System.out.println("文件名字： " + photoFileName.get(i));
			System.out.println("文件类型： " + photoContentType.get(i));
			goodsService.addGoodsPicture(goods, photo.get(i), photoFileName.get(i),
					photoContentType.get(i), i+1);
		}
		if (serviceResult.getMsg().equals("addsuccess"))// 添加商品成功
		{
			return "addgoodssuccess";// 返回个人中心
		} else// 添加商品失败
		{
			return "addgoodsfail";
		}
	}

	@Override
	public String getStoreGoodsList() {

		session = getSession();
		PageMsg msg = new PageMsg();
		Goods goods = new Goods();
		Store store = new Store();
		ServiceResult serviceResult = new ServiceResult();
		try {
			User user = (User) session.getAttribute("user");
			System.out.println(user);
			store.setStStoreid(3);// 现在的店铺信息显示静态的以后再动态加载
			goods.setStore(store);
			serviceResult = goodsService.getStoreGoodsList(goods, msg);
		} catch (Exception e) {
			System.out
					.println("未知原因（具体原因请见下面错误）导致按“店铺id”查找商品列表失败，自动变为查看所有商品暂时这样，以后一定要改");
			serviceResult = goodsService.getStoreGoodsList(null, msg);
			e.printStackTrace();
		}
		storeGoodsList = (List<Goods>) serviceResult.getObj();
		return "showstore";
	}

	@Override
	public void certification() {
		
		System.out.println("实名认证中...");
		System.out.println(realname);
		System.out.println(school);
		System.out.println(major);
		System.out.println(number);
		System.out.println(call);
		System.out.println(grade);
		
		session = getSession();
		User user = (User) session.getAttribute("user");
		if(user == null)
		{
			try {
				response.sendRedirect("login.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else
		{
			certificationStatu();
			session = getSession();
			if(!session.getAttribute("certificationStatu").equals("auditing") && !session.getAttribute("certificationStatu").equals("success"))
			{
				Certification cer = new Certification();
				cer.setCtAddress(call);
				cer.setCtMajor(major);
				cer.setUser(user);
				cer.setCtSchool(school);
				cer.setCtRealname(realname);
				cer.setCtStudentid(number);
				cer.setCtGrade(grade);
				
				functionService.certification(cer);
			}
			try {
				response.sendRedirect("person/shopStatu");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	@Override
	public String certificationStatu() {

		ServiceResult serviceResult = new ServiceResult();
		session = getSession();
		System.out.println("PersonAction.certificationStatu方法中");
		System.out.println(session.getAttribute("user"));
		if(session.getAttribute("user") == null)
		{
			return "login";
		}
		else
		{
			User user = (User) session.getAttribute("user");
			serviceResult = functionService.getCertificationStatu(user);
			String statu = serviceResult.getMsg();
			System.out.println("statu：" + statu);
			if(!statu.equals("Exception"))
			{
				session.setAttribute("certificationStatu", statu);//给session实名认证状态
			}
			else
			{
				return "error";
			}
			return "applyShop";
		}
	}

	@Override
	public void applyShop() {
		
		System.out.println("店铺申请中...");
		System.out.println(storeName);
		System.out.println(mainSell);
		System.out.println(storeAdd);
		System.out.println(storeBrief);
		
		session = getSession();
		User user = (User) session.getAttribute("user");
		Store oldStore = (Store) session.getAttribute("store");
		if(oldStore == null && user != null)
		{
			Store store = new Store();
			store.setStMain(mainSell);
			store.setStStorename(storeName);
			store.setStStoreadd(storeAdd);
			store.setStPicture("#images/ctx.png");//默认图片
			store.setUser(user);
			
			
			functionService.applyShop(store);
		}
		
		try {
			response.sendRedirect("person/shopStatu");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public String shopStatu() {
		
		ServiceResult serviceResult = new ServiceResult();
		session = getSession();
		System.out.println("PersonAction.shopStatu方法中");
		User user = (User) session.getAttribute("user");
		System.out.println(user);
		if(user == null)
		{
			return "login";
		}
		else
		{
			serviceResult = functionService.getStoreStatu(user);
			String statu = serviceResult.getMsg();
			System.out.println("statu：" + statu);
			if(!statu.equals("Exception"))
			{
				session.setAttribute("storeStatu", statu);//给session店铺状态
				if(statu.equals("success") || statu.equals("auditing"))
				{
					session.setAttribute("store", serviceResult.getObj());
				}
			}
			else
			{
				return "error";
			}
			String ret = certificationStatu();
			if(session.getAttribute("certificationStatu").equals("success"))
			{
				if(statu.equals("success") || statu.equals("auditing"))
				{
					return "SC";
				}
			}
			return ret;
		}
		
	}

}
