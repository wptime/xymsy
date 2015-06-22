package com.xymsy.actionImp;

import java.io.IOException;
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


import com.xymsy.action.ISellerAction;
import com.xymsy.entity.Goods;
import com.xymsy.entity.Store;
import com.xymsy.entity.User;
import com.xymsy.serviceImp.FunctionService;
import com.xymsy.serviceImp.GoodsService;
import com.xymsy.util.JsonUitl;
import com.xymsy.util.PageMsg;
import com.xymsy.util.ServiceResult;

/**
 * 
 * @author Administrator
 *
 */
public class SellerAction implements ISellerAction, ServletRequestAware, ServletResponseAware,
ServletContextAware, SessionAware {
	
	
	
	private ServletContext application;// Servlet上下文

	private HttpServletRequest request;// request对象
	private HttpServletResponse response;// response对象
	private HttpSession session;// session对象
	
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
	
	/******下**页面上获取的信息***********/
	
	private String pageNum;//第几页
	private String size;//每页显示多少数据
	private Integer totalNum;//总共有多少数据
	private Integer totalPage;//总共有多少页
	private String goodsStatu;//出售中的商品还是其他商品状态：	0:待审核	1:未发布	2:发布	3:已下架	4:审核不通过 5:已删除

	private String goodsId;
	private String aimStatu;
	
	
	public String getAimStatu() {
		return aimStatu;
	}

	public void setAimStatu(String aimStatu) {
		this.aimStatu = aimStatu;
	}

	public String getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}

	public String getPageNum() {
		return pageNum;
	}

	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public Integer getTotalNum() {
		return totalNum;
	}

	public void setTotalNum(Integer totalNum) {
		this.totalNum = totalNum;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public String getGoodsStatu() {
		return goodsStatu;
	}

	public void setGoodsStatu(String goodsStatu) {
		this.goodsStatu = goodsStatu;
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
/******************************************************************************/

	@Override
	public void storeGoodsList() {
		
		Goods goods = new Goods();
		PageMsg msg = new PageMsg();
		try{
			msg.setPageNum(Integer.parseInt(pageNum));
			//System.out.println(msg.getPageNum());
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		try{
			msg.setSize(Integer.parseInt(size));
			//System.out.println(msg.getSize());
		}catch (Exception e) {
			e.printStackTrace();
		}

		try{
			msg.setNum(totalNum);
		}catch (Exception e) {
			e.printStackTrace();
		}

		try{
			msg.setPageTotal(totalPage);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		session = getSession();
		User user = (User) session.getAttribute("user");
		Store store = (Store) session.getAttribute("store");
		ServiceResult serviceResult = new ServiceResult();
		List<Goods> storeGoodsList;
		try {
			if(user == null)
			{
				response.sendRedirect("login.jsp");
			}
			else if(store == null)
			{
				response.sendRedirect("person/shopStatu");
			}
			else 
			{
				try {
					System.out.println("user:" + user + "store :" + store);
					goods.setStore(store);
					System.out.println("storeid:" + store.getStStoreid() + "   goodsStatu:" + goodsStatu);
					goods.setGdStatus(goodsStatu);//商品状态，用来查找是正在卖的还是没有卖的
					serviceResult = goodsService.getStoreGoodsList(goods, msg);
				} catch (Exception e) {
					System.out.println("未知原因（具体原因请见下面错误）导致按“店铺id”查找商品列表失败，自动变为查看所有商品暂时这样，以后一定要改");
					//serviceResult = goodsService.getStoreGoodsList(null, msg);
					e.printStackTrace();
					response.sendRedirect("error.jsp");
				}
				storeGoodsList = (List<Goods>) serviceResult.getObj();
				Map<String, Object> map = new HashMap<String, Object>();
	
				System.out.println("pageNum:" + pageNum + " size:" + size
						+ " totalNum:" + totalNum + " totalPage:" + totalPage);
				
				System.out.println("pageNum:" + msg.getPageNum() + " size:" + msg.getSize()
						+ " totalNum:" + msg.getNum() + " totalPage:" + msg.getPageTotal());
				
				/*System.out.println(storeGoodsList.size());*/
				for(Goods gd:storeGoodsList)
				{
					System.out.println(gd.getGdSaletime());
				}

				//System.out.println("pageNum:" + msg.getPageNum() + msg.getNum() + msg.getPageTotal() + msg.getSize());
				map.put("totalNum", msg.getNum());
				map.put("totalPage", msg.getPageTotal());
				map.put("pageNum", msg.getPageNum());
				map.put("size", msg.getSize());
				map.put("list", storeGoodsList);
				map.put("goodsStatu", goodsStatu);
				JsonUitl.sentJsonString(map);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Override
	public void deleteGoods() {
		
		int id = -1;
		String tempStatu = "7";//状态7是删除
		if(aimStatu.equals("2") || aimStatu.equals("3"))
		{
			tempStatu = aimStatu;
		}
		try{
			id = Integer.parseInt(goodsId);
		}catch(NumberFormatException e){
			System.out.println("删除商品转换id错误！");
			e.printStackTrace();
		}
		session = getSession();
		User user = (User) session.getAttribute("user");
		Store store = (Store) session.getAttribute("store");
		ServiceResult serviceResult = new ServiceResult();
		if(user == null)
		{
			try {
				response.sendRedirect("login.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(store == null)
		{
			try {
				response.sendRedirect("person/shopStatu");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else
		{
			PageMsg msg = new PageMsg();
			Goods goods = new Goods();
			goods.setGdGoodsid(id);
			serviceResult = goodsService.getGoodsInfo(goods, msg);
			goods = (Goods) serviceResult.getObj();
			System.out.println(goods.getGdGoodsname());
			System.out.println(store.getStStoreid());
			if(store.getStStoreid().equals(goods.getStore().getStStoreid()))//如果获取的商品的所属商店id和当前店铺id一致，则可以删除给商品
			{
				System.out.println(aimStatu);
				if(aimStatu.equals("7") || aimStatu.equals("2") || aimStatu.equals("3"))
				{
					serviceResult = goodsService.deleteGoods(id, tempStatu);//删除商品/修改商品状态
					System.out.println(serviceResult.getMsg());
					if(serviceResult.getMsg().equals("deletesuccess"))
					{
						System.out.println("修改商品状态成功！");
					}
					else
					{
						System.out.println("修改商品状态失败！！");
					}
				}
				else
				{
					System.out.println("要修改的状态不正确！！");
				}
				//storeGoodsList();
			}
			//serviceResult = goodsService.deleteGoods(id);
			try{
			msg.setPageNum(Integer.parseInt(pageNum));
			//System.out.println(msg.getPageNum());
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		try{
			msg.setSize(Integer.parseInt(size));
			//System.out.println(msg.getSize());
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		session = getSession();
		List<Goods> storeGoodsList;
		try {
			try {
				System.out.println("user:" + user + "store :" + store);
				goods = new Goods();
				goods.setStore(store);
				System.out.println("storeid:" + store.getStStoreid() + "   goodsStatu:" + goodsStatu);
				goods.setGdStatus(goodsStatu);//商品状态，用来查找是正在卖的还是没有卖的
				serviceResult = goodsService.getStoreGoodsList(goods, msg);
			} catch (Exception e) {
				System.out.println("未知原因（具体原因请见下面错误）导致按“店铺id”查找商品列表失败，自动变为查看所有商品暂时这样，以后一定要改");
				//serviceResult = goodsService.getStoreGoodsList(null, msg);
				e.printStackTrace();
				response.sendRedirect("error.jsp");
			}
			storeGoodsList = (List<Goods>) serviceResult.getObj();
			Map<String, Object> map = new HashMap<String, Object>();

			System.out.println("pageNum:" + pageNum + " size:" + size
					+ " totalNum:" + totalNum + " totalPage:" + totalPage);
			
			System.out.println("pageNum:" + msg.getPageNum() + " size:" + msg.getSize()
					+ " totalNum:" + msg.getNum() + " totalPage:" + msg.getPageTotal());
			
			/*System.out.println(storeGoodsList.size());*/
			for(Goods gd:storeGoodsList)
			{
				System.out.println(gd.getGdSaletime());
			}

			//System.out.println("pageNum:" + msg.getPageNum() + msg.getNum() + msg.getPageTotal() + msg.getSize());
			map.put("totalNum", msg.getNum());
			map.put("totalPage", msg.getPageTotal());
			map.put("pageNum", msg.getPageNum());
			map.put("size", msg.getSize());
			map.put("list", storeGoodsList);
			map.put("goodsStatu", goodsStatu);
			JsonUitl.sentJsonString(map);
		}catch(IOException e){
			e.printStackTrace();
		}
		}
	}
}


