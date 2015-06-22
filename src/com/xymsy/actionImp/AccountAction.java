package com.xymsy.actionImp;

import java.io.ByteArrayInputStream;
import java.util.Date;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

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

import com.xymsy.util.SecurityCode;
import com.xymsy.util.SecurityImage;
import com.xymsy.action.IAccountAction;
import com.xymsy.entity.User;
import com.xymsy.serviceImp.AccountService;
import com.xymsy.util.ServiceResult;

/**
 * 
 * @author Administrator 账户管理action：登录，注册
 */
public class AccountAction implements IAccountAction, ServletRequestAware,
		ServletResponseAware, ServletContextAware, SessionAware {

	private ServletContext application;// Servlet上下文

	private HttpServletRequest request;// request对象
	private HttpServletResponse response;// response对象
	private HttpSession session;// session对象
	
	/*******下**从页面获取过来的信息******/
	
	public String username;
	public String check;//验证码
	public String password;
	public String password2;
	public String nickName;
	public User user;
	
	public void setUsername(String username) {
		this.username = username;
	}

	public void setCheck(String check) {
		this.check = check;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	/*******上***从页面获取过来的信息******/
	
	private String securityCode;// 验证码【登陆、注册】
	private ByteArrayInputStream imageStream;// 图片流【验证码】

	private AccountService accountService;

	@Resource
	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}


	public void setUser(User user) {
		this.user = user;
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
	
	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		
	}
	
	public ByteArrayInputStream getImageStream() {
		return imageStream;
	}

	public void setSecurityCode(String securityCode) {
		this.securityCode = securityCode;
	}

	/**
	 * 获取当前session对象 
	 * @return 当前session对象
	 */
	public HttpSession getSession()
	{
		return ServletActionContext.getRequest().getSession(true);
	}

	/**
	 * 获取当前request对象
	 * @return
	 */
	private HttpServletRequest getRequest() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String login() {
		
		username += "";
		password += "";
		
		user = new User();
		
		user.setUsUsername(username.trim());
		user.setUsPassword(password.trim());
		System.out.println("用户名：" + user.getUsUsername() + "---密码："
				+ user.getUsPassword());
		ServiceResult result = accountService.login(user);

		if (result.getMsg().equals("logfail")) {
			System.out.println("fail");
			request.setAttribute("info", "用户名密码错误");
			return "logfail";
		} else {
			session = getSession();
			this.session.setAttribute("user", result.getObj());
			this.session.setAttribute("logintime", new Date());
			//System.out.println(session.getAttribute("user"));
			System.out.println("success");
			return "logsuccess";
		}
	}
	
	@Override
	public String register()
	{
		username += "";
		password += "";
		check += "";
		password2 += "";
		nickName += "";
		System.out.println(username);
		System.out.println(password);
		System.out.println(check);
		if(check == null)
		{
			check = "";
		}
		System.out.println(nickName);
		
		session = getSession();
		user = new User();
		String owncode = (String)session.getAttribute("ownSecurityCode");
		session.setAttribute("ownSecurityCode", securityCode());
		if(check.equals(owncode))
		{
			System.out.println("Yes");
		}
		else
		{
			System.out.println("No");
		}
//		System.out.println("用户名：" + user.getUsUsername());
//		System.out.println("密码：" + user.getUsPassword());
		ServiceResult result = null;
		if(!check.equals(owncode))
		{
			request.setAttribute("info", "验证码输入不正确");
			System.out.println(request.getAttribute("info"));
			return "registerfail";
		}
		else if(!password.equals(password2))
		{
			request.setAttribute("info", "两次密码不匹配");
			return "registerfail";
		}
		else
		{
			user.setUsUsername(username.trim());
			user.setUsPassword(password.trim());
			user.setUsPricture("#images/ctx.png");
			nickName = nickName.trim();
			System.out.println(nickName);
			if("".equals(nickName) || nickName == null)
			{
				user.setUsNickname(username.trim());
			}
			else
			{
				user.setUsNickname(nickName);
			}
			result = accountService.register(user);
		}
		if(result != null)
		{
			System.out.println(result.getMsg());
			if(result.getMsg().equals("registersuccess"))
			{
				this.session.setAttribute("user", user);
				System.out.println(session.getAttribute("user"));
				this.login();
				request.setAttribute("info", "注册成功");
				return "registersuccess";
			}
			else if(result.getMsg().equals("same"))
			{
				request.setAttribute("info", "该邮箱已被注册");
				return "registerfail";
			}
		}
		request.setAttribute("info", "注册失败");
		return "registerfail";
	}

	@Override
	public String logout()
	{
		session = getSession();
		User user = (User) session.getAttribute("user");
		if(user != null)
		{
			System.out.println(user);
			ServiceResult result = accountService.logout(user);
			//session.invalidate();
			session.setAttribute("user", null);
			session.invalidate();
		}
		
		return "logout";
	}
	
	public String securityCode() {

		// 获取默认难度和长度的验证码
		String securityCode = SecurityCode.getSecurityCode();
		imageStream = SecurityImage.getImageAsInputStream(securityCode);
		session = getSession();
		session.setAttribute("ownSecurityCode", securityCode);
		// 放入session中
		//session.put("securityCode", securityCode);
		return "securitycode";
	}

}
