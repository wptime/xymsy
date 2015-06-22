package com.xymsy.serviceImp;

import javax.annotation.Resource;

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
import com.xymsy.service.IContentService;

@Component("ContentServiceService")
@Scope("prototype")
public class ContentService implements IContentService {
	
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
}
