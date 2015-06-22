package com.xymsy.actionImp;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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

import com.xymsy.util.JsonUitl;
import com.xymsy.action.IMainAction;
import com.xymsy.entity.Goods;
import com.xymsy.entity.Order;
import com.xymsy.entity.Store;
import com.xymsy.entity.User;
import com.xymsy.serviceImp.DealService;
import com.xymsy.serviceImp.GoodsService;
import com.xymsy.util.PageMsg;
import com.xymsy.util.ServiceResult;

public class MainAction implements IMainAction, ServletRequestAware, ServletResponseAware,
ServletContextAware{
	
	
	private ServletContext application;// Servlet上下文

	private HttpServletRequest request;// request对象
	private HttpServletResponse response;// response对象
	private HttpSession session;// session对象
	
	private GoodsService goodsService;
	private DealService dealService;
	
	/******下**页面上获取的信息***********/
	private String goodsId;
	private List<Goods> recommendSGoodsList;
	private List<String> recommendGoodsPicture;//商品详细信息页面的图片
	private String left;
	private String right;
	private PageMsg pageMsg;

	private String saled;//按销量排序
	private String price;//按价格排序
	
	private String pageNum;//第几页
	private String size;//每页显示多少数据
	private Integer totalNum;//总共有多少数据
	private Integer totalPage;//总共有多少页
	
	private Integer storeId;
	private List<Goods> storeGoodsList;
	
	private String keyWord;//搜索商品列表的关键字
	
	private String qty;//购买商品数量
	private String goodsNum;//购买商品数量
	
	private List<Order> userOrderList;//用户订单列表
	
	
	


	public List<Goods> getStoreGoodsList() {
		return storeGoodsList;
	}


	public void setStoreGoodsList(List<Goods> storeGoodsList) {
		this.storeGoodsList = storeGoodsList;
	}


	public Integer getStoreId() {
		return storeId;
	}


	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}


	public String getGoodsId() {
		return goodsId;
	}


	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}

	public PageMsg getPageMsg() {
		return pageMsg;
	}


	public void setPageMsg(PageMsg pageMsg) {
		this.pageMsg = pageMsg;
	}


	public void setSize(String size) {
		this.size = size;
	}


	public void setTotalNum(Integer totalNum) {
		this.totalNum = totalNum;
	}


	public String getPageNum() {
		return pageNum;
	}


	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}


	public Integer getTotalPage() {
		return totalPage;
	}


	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}


	public String getSize() {
		return size;
	}


	public Integer getTotalNum() {
		return totalNum;
	}


	public String getKeyWord() {
		return keyWord;
	}


	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}


	public String getQty() {
		return qty;
	}


	public void setQty(String qty) {
		this.qty = qty;
	}


	public String getGoodsNum() {
		return goodsNum;
	}


	public void setGoodsNum(String goodsNum) {
		this.goodsNum = goodsNum;
	}


	public List<Order> getUserOrderList() {
		return userOrderList;
	}


	public void setUserOrderList(List<Order> userOrderList) {
		this.userOrderList = userOrderList;
	}


	/******上**页面上获取的信息***********/
	
	

	public String getSaled() {
		return saled;
	}
	

	public List<String> getRecommendGoodsPicture() {
		return recommendGoodsPicture;
	}


	public String getPrice() {
		return price;
	}


	public void setPrice(String price) {
		this.price = price;
	}


	public String getLeft() {
		return left;
	}


	public void setLeft(String left) {
		this.left = left;
	}


	public String getRight() {
		return right;
	}


	public void setRight(String right) {
		this.right = right;
	}


	public void setSaled(String saled) {
		this.saled = saled;
	}
	
	public List<Goods> getRecommendSGoodsList() {
		return recommendSGoodsList;
	}

	public HttpSession getSession() {
		return ServletActionContext.getRequest().getSession(true);
	}

	@Resource
	public void setSession(HttpSession session) {
		this.session = session;
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
	
	@Resource
	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}

	@Resource
	public void setDealService(DealService dealService) {
		this.dealService = dealService;
	}


	/********************下*****override函数******************************/
	@Override
	public String getInfo()
	{
		System.out.println("经过action");
		System.out.println(goodsId);
		Goods goodsInfo = new Goods();
		try{
			goodsInfo.setGdGoodsid(Integer.parseInt(goodsId));
		}catch(NumberFormatException e){
			System.out.println("商品id转换成integer失败");
			e.printStackTrace();
			return "goodsnotexist";
		}
		session = getSession();
		PageMsg msg = new PageMsg();
		ServiceResult serviceResult = new ServiceResult();
		serviceResult = goodsService.getGoodsInfo(goodsInfo, msg);
		session.setAttribute("goodsInfo", null);
		if(serviceResult != null)
		{
			goodsInfo = (Goods) serviceResult.getObj();
			session.setAttribute("goodsInfo", goodsInfo);
			System.out.println("商品名称" + goodsInfo.getGdGoodsname());
			
			if(goodsInfo != null)
			{
				request.setAttribute("store", goodsInfo.getStore());//给和商有关的店铺品信息
			}
			
			String allPath = goodsInfo.getGdPicture();
			String tempPath = allPath;
			try{
				int index = 0;
				int n = 0;
				if(allPath != null)
				{
					for(int i = 0;i<allPath.length();i++)
					{
						if(allPath.charAt(i) == '#')
							n++;
					}
					n -= 1;
					//recommendGoodsPicture = new String[n];
					if(n>0){
						recommendGoodsPicture = new ArrayList<String>();
					}
					else{
						recommendGoodsPicture = null;
					}
					while(tempPath.length() > 1)//分解图片字符串
					{
						System.out.println(tempPath);
						System.out.println(tempPath.indexOf("#",1));
						System.out.println(tempPath.substring(1,tempPath.indexOf("#",1)));
						recommendGoodsPicture.add(tempPath.substring(1,tempPath.indexOf("#",1)));
						System.out.println(tempPath);
						tempPath = tempPath.substring(tempPath.indexOf("#",1));
						System.out.println(tempPath.length());
					}
				}
				
			}catch(Exception e)
			{
				e.printStackTrace();
			}
			
			return "goodsinfo";
		}
		else
		{
			return "goodsnotexist";
		}
		
	}

	@Override
	public String index() {
		
		System.out.println(keyWord);
		Goods goods = new Goods();
		if(keyWord != null || !"".equals(keyWord))
		{
			goods.setGdGoodsname(keyWord);
			request.setAttribute("keyWord", keyWord);
		}
		goods.setGdStatus("2");
		ServiceResult serviceResult = new ServiceResult();
		PageMsg msg = new PageMsg();
		try{
			msg.setSize(Math.max(Integer.parseInt(size),1));
			msg.setPageNum(Math.max(Integer.parseInt(pageNum),1));
		}catch(Exception e){
			msg.setSize(16);
			msg.setPageNum(1);
			e.printStackTrace();
		}
		System.out.println(left + " " + right);
		if(left != null && !"".equals(left))
		{
			try
			{
				msg.setLeft(Double.parseDouble(left));
				System.out.println("价格左界" + Double.parseDouble(left));
			}
			catch(NumberFormatException e)
			{
				msg.setLeft(0);
				System.out.println("价格左界转换错误，自动设为默认值0");
			}
		}
		if(right != null && !"".equals(right))
		{
			try{
				msg.setRight(Double.parseDouble(right));
				System.out.println("价格右界" + Double.parseDouble(right));
			}catch(NumberFormatException e)
			{
				msg.setRight(99999999);
				System.out.println("价格右界格式化错误，自动设置为默认值99999999");
			}
		}
		
		
		if(price != null)
		{//如果按价格排序
			if(price.equals("true"))
			{
				serviceResult = goodsService.getGoodsListOrderPriceT(goods, msg);
			}
			else
			{
				serviceResult = goodsService.getGoodsListOrderPriceF(goods, msg);
			}
		}
		else
		{
			serviceResult = goodsService.getGoodsList(goods, msg);//目前默认按销量
		}
		recommendSGoodsList = (List<Goods>) serviceResult.getObj();
		pageMsg = msg;
		
		request.setAttribute("pageMsg", msg);
		request.setAttribute("keyWord", keyWord);
		
		return "index";
	}
	
	@Override
	public void getGoodsList()
	{
		Goods goods = new Goods();
		if(keyWord != null || !"".equals(keyWord)){
			goods.setGdGoodsname(keyWord);
		}
		goods.setGdStatus("2");
		ServiceResult serviceResult = new ServiceResult();
		PageMsg msg = new PageMsg();
		try{
			msg.setSize(Math.max(Integer.parseInt(size),1));
			msg.setPageNum(Math.max(Integer.parseInt(pageNum),1));
		}catch(Exception e){
			e.printStackTrace();
		}
		System.out.println(left + " " + right);
		if(left != null && !"".equals(left))
		{
			try
			{
				msg.setLeft(Double.parseDouble(left));
				System.out.println("价格左界" + Double.parseDouble(left));
			}
			catch(NumberFormatException e)
			{
				msg.setLeft(0);
				System.out.println("价格左界转换错误，自动设为默认值0");
			}
		}
		if(right != null && !"".equals(right))
		{
			try{
				msg.setRight(Double.parseDouble(right));
				System.out.println("价格右界" + Double.parseDouble(right));
			}catch(NumberFormatException e)
			{
				msg.setRight(99999999);
				System.out.println("价格右界格式化错误，自动设置为默认值99999999");
			}
		}
		
		
		if(price != null)
		{//如果按价格排序
			if(price.equals("true"))
			{
				serviceResult = goodsService.getGoodsListOrderPriceT(goods, msg);
			}
			else
			{
				serviceResult = goodsService.getGoodsListOrderPriceF(goods, msg);
			}
		}
		else
		{
			serviceResult = goodsService.getGoodsList(goods, msg);//目前默认按销量
		}
		recommendSGoodsList = (List<Goods>) serviceResult.getObj();
		pageMsg = msg;
		session.setAttribute("pageMsg", pageMsg);
		
		Map<String, Object> map = new HashMap<String, Object>();

		System.out.println("pageNum:" + pageNum + " size:" + size
				+ " totalNum:" + totalNum + " totalPage" + totalPage);

		map.put("totalNum", msg.getNum());
		map.put("totalPage", msg.getPageTotal());
		map.put("pageNum", msg.getPageNum());
		map.put("size", msg.getSize());
		map.put("list", recommendSGoodsList);
		
		JsonUitl.sentJsonString(map);
	}


	@Override
	public String enterStore() {
		
		Goods goods = new Goods();
		Store store = new Store();
		//session = getSession();
		/*if(session.getAttribute("user") == null)//这个地方不用登录就可以进去卖家店铺
		{
			return "login";
		}*/
		if(storeId == null || "".equals(storeId))
		{
			return "head";
		}
		store.setStStoreid(storeId);
		goods.setGdStatus("2");
		goods.setStore(store);
		ServiceResult serviceResult = new ServiceResult();
		PageMsg msg = new PageMsg();

		try{
			msg.setSize(Math.max(Integer.parseInt(size),1));
			msg.setPageNum(Math.max(Integer.parseInt(pageNum),1));
		}catch(Exception e){
			msg.setSize(16);
			msg.setPageNum(1);
			e.printStackTrace();
		}
		serviceResult = goodsService.getGoodsList(goods, msg);
		
		storeGoodsList = (List<Goods>) serviceResult.getObj();
		if(storeGoodsList.size()>0) {
			request.setAttribute("store", storeGoodsList.get(0).getStore());
		}
		
		pageMsg = msg;
		
		/*for(Goods g:storeGoodsList)
		{
			System.out.println(g);
		}*/
		
		return "enterstore";
	}
	
	@Override
	public String getGoodsListByKey() {

		System.out.println("关键字 ：" + keyWord);
		
		Goods goods = new Goods();
		if(keyWord != null || !"".equals(keyWord))
		{
			goods.setGdGoodsname(keyWord);
			request.setAttribute("keyWord", keyWord);
		}
		goods.setGdStatus("2");
		ServiceResult serviceResult = new ServiceResult();
		PageMsg msg = new PageMsg();
		try{
			msg.setSize(Math.max(Integer.parseInt(size),1));
			msg.setPageNum(Math.max(Integer.parseInt(pageNum),1));
		}catch(Exception e){
			msg.setSize(16);
			msg.setPageNum(1);
			e.printStackTrace();
		}
		System.out.println(left + " " + right);
		if(left != null && !"".equals(left))
		{
			try
			{
				msg.setLeft(Double.parseDouble(left));
				System.out.println("价格左界" + Double.parseDouble(left));
			}
			catch(NumberFormatException e)
			{
				msg.setLeft(0);
				System.out.println("价格左界转换错误，自动设为默认值0");
			}
		}
		if(right != null && !"".equals(right))
		{
			try{
				msg.setRight(Double.parseDouble(right));
				System.out.println("价格右界" + Double.parseDouble(right));
			}catch(NumberFormatException e)
			{
				msg.setRight(99999999);
				System.out.println("价格右界格式化错误，自动设置为默认值99999999");
			}
		}
		
		
		if(price != null)
		{//如果按价格排序
			if(price.equals("true"))
			{
				serviceResult = goodsService.getGoodsListOrderPriceT(goods, msg);
			}
			else
			{
				serviceResult = goodsService.getGoodsListOrderPriceF(goods, msg);
			}
		}
		else
		{
			serviceResult = goodsService.getGoodsList(goods, msg);//目前默认按销量
		}
		recommendSGoodsList = (List<Goods>) serviceResult.getObj();
		pageMsg = msg;
		
		request.setAttribute("pageMsg", msg);
		
		return "index";
	}


	@Override
	public String createOrder() {
		
		session = getSession();
		request.setAttribute("info", null);
		System.out.println(qty);
		//return "login";
		if(session.getAttribute("user") == null){//如果没有登录就想创建订单，就跳到登录界面
			return "login";
		}
		else{//如果用户登录
			int num = 1;
			try{
				num = Integer.parseInt(qty);
			}catch(Exception e){
				e.printStackTrace();
				return "error";
			}
			session.setAttribute("buyNum", num);
			return "createOrder";
		}
	}
	
	@Override
	public String addOrder() {//用户确认订单，提交订单后，向数据库插入订单数据
		session = getSession();
		request.setAttribute("info", null);
		//return "login";
		User user = (User) session.getAttribute("user");
		if(user == null){//如果没有登录就想创建订单，就跳到登录界面
			return "login";
		}
		else{//如果用户登录
			int num = 0;
			try{
				num = Integer.parseInt(goodsNum);
				if(num<1){
					return "error";
				}
			}catch (Exception e) {
				e.printStackTrace();
				return "error";
			}
			
			Goods goods = new Goods();
			goods = (Goods) session.getAttribute("goodsInfo");
			System.out.println("User:" + user);
			System.out.println("Goods:" + goods);
			Order order = new Order();
			order.setGoods(goods);//商品
			order.setUser(user);//下订单的人
			order.setOdOrderway("1");//支付方式
			order.setOdPrice(num * goods.getGdPrice());//订单总价
			ServiceResult serviceResult = dealService.insertOrder(order);
			
			return findUser();
		}
	}
	
	@Override
	public String findUser() {

		User user = null;
		session = getSession();
		user = (User) session.getAttribute("user");
		if(user == null)
		{
			return "login";
		}
		else
		{
			pageMsg = new PageMsg();
			pageMsg.setSize(5);
			ServiceResult serviceResult = dealService.getUserOrder(user, pageMsg);
			userOrderList = (List<Order>) serviceResult.getObj();
			for(Order o:userOrderList){
				System.out.println(o.getOdOrderid());
			}
			System.out.println("进入个人中心！");
			return "insertSuccess";
		}
	}

}
