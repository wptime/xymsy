package com.xymsy.test;

import static org.junit.Assert.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.HibernateTemplate;

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
import com.xymsy.entity.Attention;
import com.xymsy.entity.Certification;
import com.xymsy.entity.Comment;
import com.xymsy.entity.Comment_r;
import com.xymsy.entity.Goods;
import com.xymsy.entity.GoodsEval;
import com.xymsy.entity.GoodsEvalR;
import com.xymsy.entity.Kinds;
import com.xymsy.entity.Order;
import com.xymsy.entity.Store;
import com.xymsy.entity.StoreEval;
import com.xymsy.entity.StoreEvalR;
import com.xymsy.entity.Storeup;
import com.xymsy.entity.User;
import com.xymsy.util.PageMsg;


public class DaoTest {

	private static ClassPathXmlApplicationContext context;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		context = new ClassPathXmlApplicationContext("beans.xml");
	}
	
	@Test
	public void test() {
		AdminDAO adminDAO = (AdminDAO)context.getBean("adminDAO");
		if(adminDAO!=null) System.out.println("1:yes");
		
		AttentionDAO attentionDAO = new AttentionDAO();
		if(attentionDAO!=null) System.out.println("2:yes");
		
		CertificationDAO certificationDAO = new CertificationDAO();
		if(certificationDAO!=null) System.out.println("3.yes");
		
		CommentDAO commentDAO = (CommentDAO)context.getBean("commentDAO");
		if(commentDAO!=null) System.out.println("4.yes");
		
		CommentRDAO comment_rDAO = new CommentRDAO();
		if(comment_rDAO!=null) System.out.println("5.yes");
		
		GoodsDAO goodsDAO = (GoodsDAO)context.getBean("goodsDAO");
		if(goodsDAO!=null) System.out.println("6.yes");
		
		GoodsEvalDAO goodevalDAO = new GoodsEvalDAO();
		if(goodevalDAO!=null) System.out.println("7.yes");
		
		GoodsEvalRDAO goodsevalrDAO = new GoodsEvalRDAO();
		if(goodsevalrDAO!=null) System.out.println("8.yes");
		
		KindsDAO kindsDAO = new KindsDAO();
		if(kindsDAO!=null) System.out.println("9.yes");
		
		OrderDAO orderDAO = (OrderDAO)context.getBean("orderDAO");
		if(orderDAO!=null) System.out.println("10.yes");
		
		StoreDAO storeDAO = (StoreDAO)context.getBean("storeDAO");
		if(storeDAO!=null) System.out.println("11.yes");

		StoreEvalDAO storeevalDAO = (StoreEvalDAO)context.getBean("storeEvalDAO");
		if(storeevalDAO!=null) System.out.println("12.yes");

		StoreEvalRDAO storeevalrDAO = new StoreEvalRDAO();
		if(storeevalrDAO!=null) System.out.println("13.yes");

		StoreupDAO storeupDAO = new StoreupDAO();
		if(storeupDAO!=null) System.out.println("14.yes");
		
		UserDAO userDAO = (UserDAO)context.getBean("userDAO");
		if(userDAO != null) System.out.println("15:yes");
		
		System.out.println(userDAO.findById(14));
		/*HibernateTemplate hibernateTemplate = (HibernateTemplate)context.getBean("hibernateTemplate");
		if(hibernateTemplate!=null) System.out.println("yes"); 
		Session sf = (Session)hibernateTemplate.getSessionFactory().openSession();
		if(sf!=null) System.out.println("sf yes"); */
		
		User user = new User("zuoji","password","13313331333");
		System.out.println("11111");
		Date logtime = new Date();
		user.setUsRegistertime(logtime);
		user.setUsLastlogintime(logtime);
		
//		for(int i = 5;i>0;i--)
//			
//			userDAO.save(user);
			
		
		/*System.out.println("2222");
		List<User> newuser = userDAO.findByUsUsername("zuoji");
		System.out.println("33333");
		User temp;
		Iterator<User> it = newuser.iterator();
		while(it.hasNext())
		{
			temp =  it.next();
			System.out.println("id:" + temp.getUsUserid() + "  name:" + temp.getUsUsername());
		}
		List<User> u = userDAO.findByUsUsername("hhh");
		if(!u.iterator().hasNext())
		{
			System.out.println("迭代器里面没有值");
		}
		else
		{
			try 
			{
				u.iterator().next().getUsUsername();
			}catch(Exception e)
			{
				System.out.println("迭代器里面没有值");
			}
		}
		
		Date d = new Date();
		System.out.println(d);
		for(int i = 0;i < 10000000;i--);
		Date d2 = new Date();
		System.out.println(d2);
		
		Order od = new Order();
		user.setUsUserid(1);
		od.setUser(user);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//date格式化为mysql的datetime
		
		
		PageMsg msg = new PageMsg();
		List order = orderDAO.find(od, "us_userid", true, 0, 10, msg);//从第0条后面开始，找10个出来
		Iterator<Order> odt = order.iterator();
		
		//orderDAO.getTotalNum(od, msg);
		
		System.out.println("popoop");
		
		while(odt.hasNext())
		{
			Order tempod = odt.next();
			System.out.println("daotest里面的：orderid---" + tempod.getOdOrderid() + "......createtime---" + tempod.getOdCreattime());
			Goods goods = tempod.getGoods();
			if(goods != null)
			{
				System.out.println("daotest里面的：goodsid---" + goods.getGdGoodsid() + "  goodsname---" + goods.getGdGoodsname());
			}
		}
		if(odt.hasNext() == false)
		{
			System.out.println("找不到记录");
		}
		
		User utest = new User();
		utest.setUsUsername("zuoji");
		PageMsg msg0 = new PageMsg();
		List<User> resultuser = userDAO.find(utest, null, true, 1, 10, msg0);
		System.out.println("44444");
		Iterator<User> ust = resultuser.iterator();
		while(ust.hasNext())
		{
			User tempod = ust.next();
			System.out.println("daotest里面的：userid---" + tempod.getUsUserid() + "......username---" + tempod.getUsUsername());
			
		}
		System.out.println("共有" + msg0.getNum() + "条信息    是否有下一页：" + msg0.isHasNextPage() + "是否有上一页：" + msg0.isHasLastPage());
		
		PageMsg msg1 = new PageMsg();
		Store sttt = new Store();
		//sttt.setStStorename("");
		List<Store> resultstore = storeDAO.find(null, "st_storeid", false, 0, 10, msg1);
		Iterator<Store> stt = resultstore.iterator();
		while(stt.hasNext())
		{
			Store tempst = stt.next();
			System.out.println("daotest里面的：storeid---" + tempst.getStStoreid() + "     --name:" + tempst.getStStorename());
		}
		
		PageMsg msg2 = new PageMsg();
		Goods gdtt = new Goods();
		List<Goods> resultgoods = goodsDAO.find(gdtt, "gd_goodsid", true, 0, 10, msg1);
		Iterator<Goods> gdt = resultgoods.iterator();
		while(gdt.hasNext())
		{
			Goods tempst = gdt.next();
			System.out.println("daotest里面的：goodsid---" + tempst.getGdGoodsid() + "     --name:" + tempst.getGdGoodsname());
		}
		
		PageMsg msg3 = new PageMsg();
		Comment cttt = new Comment();
		List<Comment> resultct = commentDAO.find(cttt, null, true, 0, 10, msg3);
		Iterator<Comment> ctt = resultct.iterator();
		while(ctt.hasNext())
		{
			Comment tempst = ctt.next();
			System.out.println("daotest里面的：commentid---" + tempst.getCtCommentid() + "     --statu:" + tempst.getCtCommentstatus());
		}*/
		
		PageMsg msg4 = new PageMsg();
		StoreEval sel = new StoreEval();
		//storeevalDAO.save(sel);
		List<StoreEval> resultse = storeevalDAO.find(null, null, true, 0, 10, msg4);
		Iterator<StoreEval> sett = resultse.iterator();
		while(sett.hasNext())
		{
			StoreEval tempst = sett.next();
			System.out.println("daotest里面的：SelEvaluateid---" + tempst.getSelEvaluateid() + "     --content:" + tempst.getSelContent());
		}
	}
	
	@Test
	public void testcommentR()
	{
		CommentRDAO commentrDAO = (CommentRDAO)context.getBean("commentRDAO");
		if(commentrDAO!=null) System.out.println("yes");
		
		PageMsg msg = new PageMsg();
		Comment_r src = new Comment_r();
		src.setCtrContent("test");
		commentrDAO.save(src);
		List<Comment_r> resultse = commentrDAO.find(null, null, true, 0, 10, msg);
		Iterator<Comment_r> sett = resultse.iterator();
		while(sett.hasNext())
		{
			Comment_r tempst = sett.next();
			System.out.println("daotest里面的：SelEvaluateid---" + tempst.getCtrCtreplyid() + "     --content:" + tempst.getCtrContent());
		}
	}
	
	@Test
	public void testsevalR()
	{
		StoreEvalRDAO dao = (StoreEvalRDAO)context.getBean("storeEvalRDAO");
		if(dao != null) 
			System.out.println("yes");
		else
			System.out.println("no");
		
		PageMsg msg = new PageMsg();
		StoreEvalR src = new StoreEvalR();
		src.setSevrContent("test");
		dao.save(src);
		List<StoreEvalR> result = dao.find(null, null, true, 0, 10, msg);
		Iterator<StoreEvalR> s = result.iterator();
		while(s.hasNext())
		{
			StoreEvalR temp = s.next();
			System.out.println("daotest里面的：SelEvaluateid---" + temp.getSevrEvreplyid() + "     --content:" + temp.getSevrContent());
		}
	}
	
	@Test
	public void testadmin()
	{
		AdminDAO dao = (AdminDAO)context.getBean("adminDAO");
		if(dao != null) 
			System.out.println("yes");
		else
			System.out.println("no");
		
		PageMsg msg = new PageMsg();
		Admin src = new Admin();
		src.setAdUsername("username");
		src.setAdPassword("password");
		dao.save(src);
		List<Admin> result = dao.find(src, null, true, 0, 10, msg);
		Iterator<Admin> s = result.iterator();
		while(s.hasNext())
		{
			Admin temp = s.next();
			System.out.println("daotest里面的：adminusername---" + temp.getAdUsername() + "     --password:" + temp.getAdPassword());
		}
	}
	
	@Test
	public void testcer()
	{
		CertificationDAO dao = (CertificationDAO)context.getBean("certificationDAO");
		if(dao != null) 
			System.out.println("yes");
		else
			System.out.println("no");
		
		PageMsg msg = new PageMsg();
		Certification src = new Certification();
		src.setCtRealname("zuoji");
//		dao.save(src);
		List<Certification> result = dao.find(null, null, true, 0, 10, msg);
		Iterator<Certification> s = result.iterator();
		while(s.hasNext())
		{
			Certification temp = s.next();
			System.out.println("daotest里面的：id---" + temp.getCtCertificationid() + "   realname---" + temp.getCtRealname());
		}
	}
	
	@Test
	public void testkd()
	{
		KindsDAO dao = (KindsDAO)context.getBean("kindsDAO");
		if(dao != null) 
			System.out.println("yes");
		else
			System.out.println("no");
		
		PageMsg msg = new PageMsg();
		Kinds src = new Kinds();
		src.setKdKind("a");
		//dao.save(src);
		List<Kinds> result = dao.find(null, null, true, 0, 10, msg);
		Iterator<Kinds> s = result.iterator();
		while(s.hasNext())
		{
			Kinds temp = s.next();
			System.out.println("daotest里面的：kindsid---" + temp.getKdId() + "     kindname---" + temp.getKdKind());
		}
	}
	
	@Test
	public void testsu()
	{
		StoreupDAO dao = (StoreupDAO)context.getBean("storeupDAO");
		if(dao != null) 
			System.out.println("yes");
		else
			System.out.println("no");
		
		PageMsg msg = new PageMsg();
		Storeup src = new Storeup();
		//dao.save(src);
		src.setSuStoreup(1);
		List<Storeup> result = dao.find(src, null, true, 0, 10, msg);
		Iterator<Storeup> s = result.iterator();
		while(s.hasNext())
		{
			Storeup temp = s.next();
			System.out.println("daotest里面的：storeupid---" + temp.getSuStoreup());
		}
	}
	
	@Test
	public void testat()
	{
		AttentionDAO dao = (AttentionDAO)context.getBean("attentionDAO");
		if(dao != null) 
			System.out.println("yes");
		else
			System.out.println("no");
		
		PageMsg msg = new PageMsg();
		Attention src = new Attention();
		//dao.save(src);
		//src.setSuStoreup(1);
		List<Attention> result = dao.find(null, "at_attentionid", false, 0, 10, msg);
		Iterator<Attention> s = result.iterator();
		while(s.hasNext())
		{
			Attention temp = s.next();
			System.out.println("daotest里面的：attentionid---" + temp.getAtAttentionid());
		}
	}
	
	@Test
	public void testgel()
	{
		GoodsEvalDAO dao = (GoodsEvalDAO)context.getBean("goodsEvalDAO");
		if(dao != null) 
			System.out.println("yes");
		else
			System.out.println("no");
		
		PageMsg msg = new PageMsg();
		GoodsEval src = new GoodsEval();
		src.setGelContent("test-gel");
		//dao.save(src);
		List<GoodsEval> resultse = dao.find(null, null, true, 0, 10, msg);
		Iterator<GoodsEval> s = resultse.iterator();
		while(s.hasNext())
		{
			GoodsEval temp = s.next();
			System.out.println("daotest里面的：GoodEvalid---" + temp.getGelEvaluateid() + "     --content:" + temp.getGelContent());
			if(temp.getUser() != null) 
			{
				System.out.println("user---" + temp.getUser().getUsUsername());
			}
			if(temp.getGoods() != null)
			{
				System.out.println("goods---" + temp.getGoods().getGdGoodsname());
			}
		}
	}
	
	@Test
	public void testgelR()
	{
		GoodsEvalRDAO dao = (GoodsEvalRDAO)context.getBean("goodsEvalRDAO");
		if(dao != null) 
			System.out.println("yes");
		else
			System.out.println("no");
		
		PageMsg msg = new PageMsg();
		GoodsEvalR src = new GoodsEvalR();
		src.setGevrContent("test");
		//dao.save(src);
		src.setGrvrEvreplystatus("1");
		List<GoodsEvalR> result = dao.find(src, null, true, 0, 10, msg);
		Iterator<GoodsEvalR> s = result.iterator();
		while(s.hasNext())
		{
			GoodsEvalR temp = s.next();
			System.out.println("daotest里面的：SelEvaluateid---" + temp.getGevrEverplyid() + "     --content:" + temp.getGevrContent());
		}
	}
	
	@Test
	public void testupus()
	{
		User user = new User();
		//user.setUsUsername("12345");
		UserDAO userDAO = (UserDAO)context.getBean("userDAO");
		if(userDAO != null) System.out.println("15:yes");
		
		List<User> list = userDAO.findByUsUsername("12345");
		
		for(User u : list)
		{
			System.out.println(u);
			user = u;
		}
		user.setUsTotalonlinetime(100);
		
		userDAO.attachDirty(user);
	}
	
	@Test
	public void testgd()
	{
		Goods goods = new Goods();
		goods.setGdStatus("1");
		GoodsDAO goodsDAO = (GoodsDAO)context.getBean("goodsDAO");

		goodsDAO.find(goods, null, true, 0, 10, new PageMsg());
	}
}
