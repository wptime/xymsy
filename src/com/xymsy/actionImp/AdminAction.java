package com.xymsy.actionImp;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.util.ServletContextAware;

import com.xymsy.action.IAdminAction;
import com.xymsy.entity.Admin;
import com.xymsy.entity.Goods;
import com.xymsy.entity.Order;
import com.xymsy.entity.Store;
import com.xymsy.entity.User;
import com.xymsy.serviceImp.AccountService;
import com.xymsy.serviceImp.DealService;
import com.xymsy.serviceImp.GoodsService;
import com.xymsy.util.ServiceResult;

public class AdminAction implements IAdminAction, ServletRequestAware, ServletResponseAware,
ServletContextAware, SessionAware {
	
	
	private ServletContext application;// Servlet上下文

	private HttpServletRequest request;// request对象
	private HttpServletResponse response;// response对象
	private HttpSession session;// session对象
	
	private AccountService accountService ;
	private GoodsService goodsService;
	private DealService dealService;
	
	/******下**页面上获取的信息***********/
	
	List<User> userList;
	List<Store> storeList;
	List<Order> orderList;
	List<Goods> goodsList;
	List<Admin> adminList;
	
	
	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public List<Store> getStoreList() {
		return storeList;
	}

	public void setStoreList(List<Store> storeList) {
		this.storeList = storeList;
	}

	public List<Order> getOrderList() {
		return orderList;
	}

	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}

	public List<Goods> getGoodsList() {
		return goodsList;
	}

	public void setGoodsList(List<Goods> goodsList) {
		this.goodsList = goodsList;
	}

	public List<Admin> getAdminList() {
		return adminList;
	}

	public void setAdminList(List<Admin> adminList) {
		this.adminList = adminList;
	}

	/******上**页面上获取的信息***********/
	
	


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
	

	
	public AccountService getAccountService() {
		return accountService;
	}

	@Resource
	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}
	
	@Resource
	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}
	
	@Resource
	public void setDealService(DealService dealService) {
		this.dealService = dealService;
	}

	/*************************************************************************/
	
	
	@Override
	public String getAllUser() {
		
		//System.out.println("abadcda");
		List<User> list = new ArrayList<User>();
		ServiceResult serviceResult = new ServiceResult();
		
		serviceResult = accountService.getAllUser();
		list = (List<User>) serviceResult.getObj();
		
		request.setAttribute("list", list);
		userList = list;
		
		//System.out.println("chuchuchuc");
		return "showAllUser";
	}
	
	@Override
	public String getAllUserInfo() {
		
		//System.out.println("abadcda");
		List<User> list = new ArrayList<User>();
		ServiceResult serviceResult = new ServiceResult();
		
		serviceResult = accountService.getAllUser();
		list = (List<User>) serviceResult.getObj();
		
		request.setAttribute("list", list);
		userList = list;
		
		//System.out.println("chuchuchuc");
		return "showAllUserInfo";
	}
	
	@Override
	public String getTimeInfo() {
		
		List<User> list = new ArrayList<User>();
		ServiceResult serviceResult = new ServiceResult();
		
		serviceResult = accountService.getAllUser();
		list = (List<User>) serviceResult.getObj();
		
		request.setAttribute("list", list);
		userList = list;
		
		//System.out.println("chuchuchuc");
		return "showTimeInfo";	
	}
	
	@Override
	public String getBuyerInfo() {

		List<User> list = new ArrayList<User>();
		ServiceResult serviceResult = new ServiceResult();
		
		serviceResult = accountService.getAllUser();
		list = (List<User>) serviceResult.getObj();
		
		request.setAttribute("list", list);
		userList = list;
		
		//System.out.println("chuchuchuc");
		return "showBuyerInfo";	
	}
	
	@Override
	public String getSellerInfo() {

		List<Store> list = new ArrayList<Store>();
		ServiceResult serviceResult = new ServiceResult();
		
		serviceResult = accountService.getAllStore();
		list = (List<Store>) serviceResult.getObj();
		
		request.setAttribute("list", list);
		storeList = list;
		
		//System.out.println("chuchuchuc");
		return "showSellerInfo";	
	}
	
	@Override
	public String getAllStore() {
		
		List<Store> list = new ArrayList<Store>();
		ServiceResult serviceResult = new ServiceResult();
		
		serviceResult = accountService.getAllStore();
		list = (List<Store>) serviceResult.getObj();
		
		request.setAttribute("list", list);
		storeList = list;
		
		//System.out.println("chuchuchuc");
		return "showStoreInfo";	
	}
	
	@Override
	public String getAllGoods() {
		
		List<Goods> list = new ArrayList<Goods>();
		ServiceResult serviceResult = new ServiceResult();
		
		serviceResult = goodsService.getAllGoods();
		list = (List<Goods>) serviceResult.getObj();
		
		request.setAttribute("list", list);
		goodsList = list;
		
		//System.out.println("chuchuchuc");
		return "showAllGoods";	
	}
	
	@Override
	public String getSelledGoods() {

		List<Goods> list = new ArrayList<Goods>();
		ServiceResult serviceResult = new ServiceResult();
		
		serviceResult = goodsService.getAllGoods();
		list = (List<Goods>) serviceResult.getObj();
		
		request.setAttribute("list", list);
		goodsList = list;
		
		//System.out.println("chuchuchuc");
		return "showSelledGoods";
	}
	
	@Override
	public String getSellingGoods() {

		List<Goods> list = new ArrayList<Goods>();
		ServiceResult serviceResult = new ServiceResult();
		
		serviceResult = goodsService.getAllGoods();
		list = (List<Goods>) serviceResult.getObj();
		
		request.setAttribute("list", list);
		goodsList = list;
		
		//System.out.println("chuchuchuc");
		return "showSellingGoods";
	}
	
	
	@Override
	public String getAllAdmin() {

		List<Admin> list = new ArrayList<Admin>();
		ServiceResult serviceResult = new ServiceResult();
		
		serviceResult = accountService.getAllAdmin();
		list = (List<Admin>) serviceResult.getObj();
		
		request.setAttribute("list", list);
		adminList = list;
		return "showAllAdmin";
	}
}
