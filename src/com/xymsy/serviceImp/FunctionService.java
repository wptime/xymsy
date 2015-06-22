package com.xymsy.serviceImp;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
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
import com.xymsy.entity.Certification;
import com.xymsy.entity.Store;
import com.xymsy.entity.User;
import com.xymsy.service.IFunctionService;
import com.xymsy.util.PageMsg;
import com.xymsy.util.ServiceResult;

@Component("FunctionService")
@Scope("prototype")
public class FunctionService implements IFunctionService {
	
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

	@Override
	public ServiceResult getCertificationStatu(User user) {
		
		ServiceResult serviceResult = new ServiceResult();
		serviceResult.setMsg("notsubmit");
		serviceResult.setObj(null);
		Certification certification = new Certification();
		PageMsg msg = new PageMsg();
		
		certification.setUser(user);
		List <Certification> list = certificationDAO.find(certification, null, false, 0, 10, msg);
		System.out.println("size：" + list.size());
		if(list.size() > 1)
		{
			System.out.println("有多条该用户的审核数据");
		}
		for(Certification ct : list)
		{
			System.out.println(ct.getUser().getUsUserid() + " certification " + user.getUsUserid());
			if(ct.getUser().getUsUserid().equals(user.getUsUserid()))
			{
				System.out.println(ct);
				String statu = ct.getCtStatus();
				System.out.println("certificationStatu : " + statu);
				if(statu.equals("0"))//审核中
				{
					serviceResult.setMsg("auditing");
					serviceResult.setObj(null);
					break;
				}
				else if(statu.equals("1"))//审核未通过
				{
					serviceResult.setMsg("fail");
					serviceResult.setObj(null);
				}
				else if(statu.equals("2"))//审核已通过
				{
					serviceResult.setMsg("success");
					serviceResult.setObj(null);
					break;
				}
				else
				{
					System.out.println("异常的实名认证审核状态");
					serviceResult.setMsg("Exception");
					serviceResult.setObj(null);
				}
			}
		}
		
		return serviceResult;
	}

	@Override
	public ServiceResult getStoreStatu(User user) {
		
		ServiceResult serviceResult = new ServiceResult();
		serviceResult.setMsg("hasnostore");
		serviceResult.setObj(null);
		Store store = new Store();
		PageMsg msg = new PageMsg();
		
		store.setUser(user);
		List <Store> list = storeDAO.find(store, null, false, 0, 10, msg);
		System.out.println("storesize：" + list.size());
		if(list.size() > 1)
		{
			System.out.println("有多条该用户的开店审核数据");
		}
		for(Store st : list)
		{
			System.out.println(st.getUser().getUsUserid() + " store " + user.getUsUserid());
			if(st.getUser().getUsUserid().equals(user.getUsUserid()))
			{
				String statu = st.getStStorestatus();
				System.out.println("storeStatu:" + statu);
				if(statu.equals("0"))//审核中
				{
					serviceResult.setMsg("auditing");
					serviceResult.setObj(st);
					break;
				}
				else if(statu.equals("1"))//审核未通过
				{
					serviceResult.setMsg("fail");
					serviceResult.setObj(null);
				}
				else if(statu.equals("2"))//审核已通过
				{
					serviceResult.setMsg("success");
					serviceResult.setObj(st);
					break;
				}
				else
				{
					System.out.println("异常的店铺审核状态");
					serviceResult.setMsg("Exception");
					serviceResult.setObj(null);
				}
			}
		}
		
		return serviceResult;
	}

	@Override
	public ServiceResult certification(Certification cer) {//添加实名认证表
		
		ServiceResult serviceResult = new ServiceResult();

		Date date = new Date(new Date().toGMTString());
		cer.setCtCreatetime(date);
		cer.setCtStatus("0");//////暂时静态添加为"审核中"
		System.out.println("存东西前");
		certificationDAO.save(cer);
		System.out.println("存东西后");
		
		return serviceResult;
	}

	@Override
	public ServiceResult applyShop(Store store) {
		
		ServiceResult serviceResult = new ServiceResult();

		Date date = new Date(new Date().toGMTString());
		store.setStCreatetime(date);
		store.setStStorestatus("0");//////暂时静态添加为审核中
		store.setStGoodsnum(0);
		store.setStScore(0);
		store.setStAttentionnum(0);
		
		storeDAO.save(store);
		
		return serviceResult;
	}

	@Override
	public String uploadPicture(File file, String fileName, String ext,
			String no) {
		
		String result = "#";
		
		File save = new File(ServletActionContext.getServletContext()
				.getRealPath("goodspicture"), no);
		
		InputStream ins = null;
		OutputStream ous = null;
		
		try{
			System.out.println(save);
			save.getParentFile().mkdir();
			ins = new FileInputStream(file);
			ous = new FileOutputStream(save);
			byte[] b = new byte[1024];
			int len = 0;
			while ((len = ins.read(b)) != -1) {
				ous.write(b, 0, len);
			}
			return ("goodspicture" + File.separator + no);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		} finally {
			if (ous != null)
				try {
					ous.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			if (ins != null)
				try {
					ins.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
		
		return result;
	}
	
	

}
