package com.xymsy.serviceImp;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.persistence.Entity;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.xymsy.daoImp.AdminDAO;
import com.xymsy.daoImp.AttentionDAO;
import com.xymsy.daoImp.CertificationDAO;
import com.xymsy.daoImp.CommentDAO;
import com.xymsy.daoImp.CommentRDAO;
import com.xymsy.daoImp.GoodsDAO;
import com.xymsy.daoImp.GoodsEvalDAO;
import com.xymsy.daoImp.GoodsEvalRDAO;
import com.xymsy.daoImp.KindsDAO;
import com.xymsy.daoImp.OrderDAO;
import com.xymsy.daoImp.StoreDAO;
import com.xymsy.daoImp.StoreEvalDAO;
import com.xymsy.daoImp.StoreEvalRDAO;
import com.xymsy.daoImp.StoreupDAO;
import com.xymsy.daoImp.UserDAO;
import com.xymsy.entity.Admin;
import com.xymsy.entity.User;
import com.xymsy.service.IAccountService;
import com.xymsy.util.MyDate;
import com.xymsy.util.PageMsg;
import com.xymsy.util.ServiceResult;


@Component("AccountService")
@Scope("prototype")
public class AccountService implements IAccountService {
	
	
	private AdminDAO admindao;
	private AttentionDAO attentionDAO;
	private CertificationDAO certificationDAO;
	private CommentDAO commentDAO;
	private CommentRDAO commentrDAO;
	private GoodsDAO goodsDAO;
	private GoodsEvalDAO goodsevalDAO;
	private GoodsEvalRDAO goodsevalrDAO;
	private KindsDAO kindsDAO;
	private OrderDAO orderDAO;
	private StoreDAO storeDAO;
	private StoreEvalDAO storeevalDAO;
	private StoreEvalRDAO storeevalrDAO;
	private StoreupDAO storeupDAO;
	private UserDAO userDAO;
	
	@Resource
	public void setAdmindao(AdminDAO admindao) {
		this.admindao = admindao;
	}
	
	@Resource
	public void setAttentionDAO(AttentionDAO attentionDAO) {
		this.attentionDAO = attentionDAO;
	}
	
	@Resource
	public void setCertificationDAO(CertificationDAO certificationDAO) {
		this.certificationDAO = certificationDAO;
	}
	
	@Resource
	public void setCommentDAO(CommentDAO commentDAO) {
		this.commentDAO = commentDAO;
	}
	
	@Resource
	public void setCommentrDAO(CommentRDAO commentrDAO) {
		this.commentrDAO = commentrDAO;
	}
	
	@Resource
	public void setGoodsDAO(GoodsDAO goodsDAO) {
		this.goodsDAO = goodsDAO;
	}
	
	@Resource
	public void setGoodsevalDAO(GoodsEvalDAO goodsevalDAO) {
		this.goodsevalDAO = goodsevalDAO;
	}
	
	@Resource
	public void setGoodsevalrDAO(GoodsEvalRDAO goodsevalrDAO) {
		this.goodsevalrDAO = goodsevalrDAO;
	}
	
	@Resource
	public void setKindsDAO(KindsDAO kindsDAO) {
		this.kindsDAO = kindsDAO;
	}
	
	@Resource
	public void setOrderDAO(OrderDAO orderDAO) {
		this.orderDAO = orderDAO;
	}
	
	@Resource
	public void setStoreDAO(StoreDAO storeDAO) {
		this.storeDAO = storeDAO;
	}
	
	@Resource
	public void setStoreevalDAO(StoreEvalDAO storeevalDAO) {
		this.storeevalDAO = storeevalDAO;
	}
	
	@Resource
	public void setStoreevalrDAO(StoreEvalRDAO storeevalrDAO) {
		this.storeevalrDAO = storeevalrDAO;
	}
	
	@Resource
	public void setStoreupDAO(StoreupDAO storeupDAO) {
		this.storeupDAO = storeupDAO;
	}
	
	@Resource
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	/*****************以上是DAO资源注入**********************/
	
	@Override
	public ServiceResult login(User user)
	{
		ServiceResult serviceResult = new ServiceResult();
		
		if(user.getUsUsername() != null && user.getUsPassword() != null)
		{
			if(!user.getUsUsername().equals("") && !user.getUsPassword().equals(""))
			{
				List<User> list = userDAO.findByUsUsername(user.getUsUsername());//userDAO.find(user, null, true, 0, 10, new PageMsg());
				for(User u : list)
				{
					System.out.println(u);
					if(u.getUsUsername().equals(user.getUsUsername()) && u.getUsPassword().equals(user.getUsPassword()))
					{
						Date time = new Date((new Date()).toGMTString());
						u.setUsLastlogintime(time);
						userDAO.attachDirty(u);
						serviceResult.setMsg("logsuccess");
						serviceResult.setObj(u);
						return serviceResult;
					}
				}
			}
		}
		serviceResult.setMsg("logfail");
		serviceResult.setObj(null);
		return serviceResult;
	}
	
	@Override
	public ServiceResult register(User user)
	{
		ServiceResult serviceResult = new ServiceResult();
		
		if(user.getUsUsername() != null && user.getUsPassword() != null)
		{
			if(!user.getUsUsername().equals("") && !user.getUsPassword().equals(""))
			{
				List<User> list = userDAO.findByUsUsername(user.getUsUsername());//userDAO.find(user, null, true, 0, 10, new PageMsg());
				for(User u : list)
				{
					System.out.println(u);
					if(u.getUsUsername().equals(user.getUsUsername()))
					{
						serviceResult.setMsg("same");
						serviceResult.setObj(null);
						return serviceResult;
					}
				}
				Date time = new Date((new Date()).toGMTString());
				user.setUsRegistertime(time);
				user.setUsLastlogintime(time);
				user.setUsTotalonlinetime(0);
				user.setUsSex("未知");
				user.setUsExp(0);
				user.setUsBuyercredit(0);
				user.setUsSellercredit(0);
				user.setUsAttentionstorenum(0);
				user.setUsStoreupgoodsnum(0);
				user.setUsPhone("12345678910");
				userDAO.save(user);
				serviceResult.setMsg("registersuccess");
				serviceResult.setObj(user);
			}
		}
		return serviceResult;
	}
	
	@Override
	public ServiceResult logout(User user)
	{
		ServiceResult serviceResult = new ServiceResult();
		
		Date time = new Date(new Date().toGMTString());
		user.setUsLogouttime(time);
		System.out.println("用户" + user.getUsUsername() + "注销时间：" + time);
		int onlinetime = (int) (user.getUsTotalonlinetime() + (time.getTime() - user.getUsLastlogintime().getTime())/1000);
		System.out.println(onlinetime);
		user.setUsTotalonlinetime(onlinetime);
		
		userDAO.attachDirty(user);
		
		return serviceResult;
	}
	
	@Override
	public ServiceResult getAllUser() {
		
		ServiceResult serviceResult = new ServiceResult();
		
		List<User> list = userDAO.findAll();
		
		serviceResult.setObj(list);
		serviceResult.setMsg("getAllUser");
		
		return serviceResult;
	}
	
	@Override
	public ServiceResult getAllStore() {
	
		ServiceResult serviceResult = new ServiceResult();
		
		List<User> list = storeDAO.findAll();
		
		serviceResult.setObj(list);
		serviceResult.setMsg("getAllStore");
		
		return serviceResult;
	}
	
	
	@Override
	public ServiceResult getAllAdmin() {

		ServiceResult serviceResult = new ServiceResult();
		
		List<Admin> list = admindao.findAll();
		
		serviceResult.setObj(list);
		serviceResult.setMsg("getAllAdmin");
		
		return serviceResult;
	}

}
