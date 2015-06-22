package com.xymsy.serviceImp;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
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
import com.xymsy.entity.Goods;
import com.xymsy.entity.Store;
import com.xymsy.service.IGoodsService;
import com.xymsy.util.PageMsg;
import com.xymsy.util.ServiceResult;

@Component("GoodsService")
@Scope("prototype")
public class GoodsService implements IGoodsService {

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

	/********** 以上是DAO资源的注入 **********/

	@Override
	public ServiceResult getGoodsList(Goods goods, PageMsg msg) {

		ServiceResult serviceResult = new ServiceResult();
		if (goods != null) {
			List<Goods> goodsList = null;
			goodsList = goodsDAO.find(goods, "gd_saled", false, msg.getSize()
					* (msg.getPageNum() - 1), msg.getSize(), msg);
			
			/*for(Goods gd:goodsList){
				System.out.println(gd.getGdGoodsid() + "----" + gd.getGdGoodsname());
			}*/

			for (int i = 0; i < goodsList.size(); i++) {
				if (goods.getStore() != null) {
					if (!goods.getStore().getStStoreid()
							.equals(goodsList.get(i).getStore().getStStoreid())) {
						System.out.println("有商店id不完全匹配的！");
						goodsList.remove(i);
						msg.num--;
						if(msg.pageTotal * msg.size <= msg.num){
							msg.pageTotal--;
							if(msg.pageTotal<1){
								msg.pageTotal=1;
							}
						}
					}
				}
			}

			serviceResult.setObj(goodsList);
			System.out.println("totalPage:" + msg.getPageTotal());
			serviceResult.setMsg("按销售量排序");
		} else {
			serviceResult.setMsg("没有搜索条件");
		}

		return serviceResult;
	}

	@Override
	public ServiceResult getGoodsListOrderPriceT(Goods goods, PageMsg msg) {

		ServiceResult serviceResult = new ServiceResult();
		if (goods != null) {
			List<Goods> goodsList = null;
			goodsList = goodsDAO.find(goods, "gd_price", true, 0, 20, msg);
			serviceResult.setObj(goodsList);
			serviceResult.setMsg("按价格从低到高排序");
		} else {
			serviceResult.setMsg("没有搜索条件");
		}

		return serviceResult;
	}

	@Override
	public ServiceResult getGoodsListOrderPriceF(Goods goods, PageMsg msg) {

		ServiceResult serviceResult = new ServiceResult();
		if (goods != null) {
			List<Goods> goodsList = null;
			goodsList = goodsDAO.find(goods, "gd_price", false, 0, 20, msg);
			serviceResult.setObj(goodsList);
			serviceResult.setMsg("按价格从高到低排序");
		} else {
			serviceResult.setMsg("没有搜索条件");
		}

		return serviceResult;
	}

	@Override
	public ServiceResult addGoods(Goods goods) {

		ServiceResult serviceResult = new ServiceResult();
		try {
			Date time = new Date(new Date().toGMTString());
			Store store = goods.getStore();

			goods.setGdClicked(0);// 点击量
			goods.setGdCreatetime(time);// 创建时间

			goods.setGdSaletime(time);// 暂时把商品开始销售时间设置为创建时间，以后要是有情况可以修改

			goods.setGdSaled(0);// 销售量
			goods.setGdStatus("1");// 状态
			goods.setGdStoreupnum(0);// 收藏量
			goods.setGdPicture("#images/picture-example.png#");

			System.out.println(goods);

			goodsDAO.save(goods);
			serviceResult.setMsg("addsuccess");
			serviceResult.setObj(goods);
			System.out.println("添加商品成功");

			store.setStGoodsnum(store.getStGoodsnum() + 1);// 商品添加 成功后改变商店商品种数
			storeDAO.attachDirty(store);

			System.out.println("添加商品完后，显示id：" + goods.getGdGoodsid());
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("未知原因，添加商品失败");
			serviceResult.setMsg("addfail");
			serviceResult.setObj(null);
		}

		return serviceResult;
	}

	@Override
	public ServiceResult getGoodsInfo(Goods goods, PageMsg msg) {

		ServiceResult serviceResult = new ServiceResult();
		Goods resgoods = null;
		if (goods != null) {
			try {
				resgoods = goodsDAO.findById(goods.getGdGoodsid());
				serviceResult.setObj(resgoods);
				serviceResult.setMsg("按商品id查找成功");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return serviceResult;
	}

	@Override
	public ServiceResult getStoreGoodsList(Goods goods, PageMsg msg) {

		ServiceResult serviceResult = new ServiceResult();
		try {
			List<Goods> list = goodsDAO.find(goods, null, false, msg.size * (msg.pageNum - 1), msg.getSize(), msg);
			int i;
			int listSize = list.size();
			// System.out.println(listSize);
			for (i = 0; i < listSize; i++) {
				if (!list.get(i).getStore().getStStoreid()
						.equals(goods.getStore().getStStoreid())) {
					list.remove(i);
				}
			}
			serviceResult.setObj(list);
			serviceResult.setMsg("按店铺查找商品成功");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return serviceResult;
	}

	@Override
	public ServiceResult addGoodsPicture(Goods goods, File file,
			String fileName, String contentType, Integer id) {
		
		if(goods.getGdPicture().equals("#images/picture-example.png#"))
		{
			goods.setGdPicture("#");
		}

		String[] staext = { ".bmp", ".png", "gif", ".jpg", ".jpeg" };

		ServiceResult serviceResult = new ServiceResult();
		if (goods != null) {
			if (file != null) {
				String ext = fileName.substring(fileName.lastIndexOf("."))
						.toLowerCase();// 获取文件扩展名
				System.out.println("文件扩展名为：" + ext);
				String no = new String("");
				boolean is = false;// 是否为正确格式的可上传图片
				for (String str : staext) {
					if (str.equals(ext))// 图片格式符合
					{
						is = true;
					}
				}
				if (is) {
					no = goods.getGdGoodsid().toString() + "_" + id.toString()
							+ ext;// 构造存储后的文件名字
					uploadpicture(file, fileName, ext, no);
					String path = "goodspicture" + File.separator + no;
					String goodspicturepath = goods.getGdPicture() + path + "#";
					System.out.println(goodspicturepath);
					goods.setGdPicture(goodspicturepath);
					goodsDAO.attachDirty(goods);
				} else {
					serviceResult.setMsg(fileName
							+ "文件上传失败！不允许上传该类型文件！只可上传bmp、png、gif、jpg、jpeg格式图片");
					return serviceResult;
				}
			}
		}

		return serviceResult;
	}

	@Override
	public String uploadpicture(File file, String fileName, String ext,
			String no) {

		File save = new File(ServletActionContext.getServletContext()
				.getRealPath("goodspicture"), no);

		InputStream ins = null;
		OutputStream ous = null;

		try {
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

		} catch (Exception e) {
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
		return null;
	}

	@Override
	public ServiceResult deleteGoods(Integer goodsId, String aimStatu) {

		ServiceResult serviceResult = new ServiceResult();
		if (goodsId == -1) {
			return serviceResult;
		} else// 检查这个商品是否是该用户所开的该商店，确认之后修改商品状态
		{
			Goods goods = new Goods();
			goods.setGdGoodsid(goodsId);
			goods = goodsDAO.findById(goodsId);
			goods.setGdStatus(aimStatu);

			goodsDAO.attachDirty(goods);
			serviceResult.setObj(goods);

			serviceResult.setMsg("deletesuccess");// 写是这么写，表示的是修改状态成功
			return serviceResult;
		}
	}
	
	@Override
	public ServiceResult getAllGoods() {
		
		ServiceResult serviceResult = new ServiceResult();
		
		List<Goods> list = new ArrayList<Goods>();
		list = goodsDAO.findAll();
		
		serviceResult.setMsg("getAllGoods");
		serviceResult.setObj(list);
		
		return serviceResult;
	}
}
