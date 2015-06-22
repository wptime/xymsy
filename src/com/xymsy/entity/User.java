package com.xymsy.entity;
// default package

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * User entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "tb_user", catalog = "db_xymsy")
public class User implements java.io.Serializable {

	// Fields

	private Integer usUserid;
	private String usUsername;
	private String usPassword;
	private String usNickname;
	private String usSex;
	private Integer usAge;
	private String usPhone;
	private String usPricture;
	private Date usRegistertime;
	private Date usLastlogintime;
	private Date usLogouttime;
	private Integer usTotalonlinetime;
	private Integer usPurchase;
	private Integer usStoreupgoodsnum;
	private Integer usAttentionstorenum;
	private Integer usExp;
	private Integer usBuyercredit;
	private Integer usSellercredit;
	private Date usLastsignin;
	private Integer usStorenum;
	/*private Set<StoreEval> storeEvals = new HashSet<StoreEval>(0);
	private Set<Certification> certifications = new HashSet<Certification>(0);
	private Set<Storeup> storeups = new HashSet<Storeup>(0);
	private Set<Order> orders = new HashSet<Order>(0);
	private Set<StoreEvalR> storeEvalRs = new HashSet<StoreEvalR>(0);
	private Set<Attention> attentions = new HashSet<Attention>(0);
	private Set<Comment_r> comment_rs = new HashSet<Comment_r>(0);
	private Set<Comment> comments = new HashSet<Comment>(0);
	private Set<GoodsEvalR> goodsEvalRs = new HashSet<GoodsEvalR>(0);
	private Set<GoodsEval> goodsEvals = new HashSet<GoodsEval>(0);
	private Set<Store> stores = new HashSet<Store>(0);*/

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String usUsername, String usPassword, String usPhone) {
		this.usUsername = usUsername;
		this.usPassword = usPassword;
		this.usPhone = usPhone;
	}

	/** full constructor */
	public User(String usUsername, String usPassword, String usNickname,
			String usSex, Integer usAge, String usPhone, String usPricture,
			Date usRegistertime, Date usLastlogintime, Date usLogouttime,
			Integer usTotalonlinetime, Integer usPurchase,
			Integer usStoreupgoodsnum, Integer usAttentionstorenum,
			Integer usExp, Integer usBuyercredit, Integer usSellercreit,
			Date usLastsignin, Integer usStorenum/*, Set<StoreEval> storeEvals,
			Set<Certification> certifications, Set<Storeup> storeups,
			Set<Order> orders, Set<StoreEvalR> storeEvalRs,
			Set<Attention> attentions, Set<Comment_r> comment_rs,
			Set<Comment> comments, Set<GoodsEvalR> goodsEvalRs,
			Set<GoodsEval> goodsEvals, Set<Store> stores*/) {
		this.usUsername = usUsername;
		this.usPassword = usPassword;
		this.usNickname = usNickname;
		this.usSex = usSex;
		this.usAge = usAge;
		this.usPhone = usPhone;
		this.usPricture = usPricture;
		this.usRegistertime = usRegistertime;
		this.usLastlogintime = usLastlogintime;
		this.usLogouttime = usLogouttime;
		this.usTotalonlinetime = usTotalonlinetime;
		this.usPurchase = usPurchase;
		this.usStoreupgoodsnum = usStoreupgoodsnum;
		this.usAttentionstorenum = usAttentionstorenum;
		this.usExp = usExp;
		this.usBuyercredit = usBuyercredit;
		this.usSellercredit = usSellercreit;
		this.usLastsignin = usLastsignin;
		this.usStorenum = usStorenum;/*
		this.storeEvals = storeEvals;
		this.certifications = certifications;
		this.storeups = storeups;
		this.orders = orders;
		this.storeEvalRs = storeEvalRs;
		this.attentions = attentions;
		this.comment_rs = comment_rs;
		this.comments = comments;
		this.goodsEvalRs = goodsEvalRs;
		this.goodsEvals = goodsEvals;
		this.stores = stores;*/
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "us_userid", unique = true, nullable = false)
	public Integer getUsUserid() {
		return this.usUserid;
	}

	public void setUsUserid(Integer usUserid) {
		this.usUserid = usUserid;
	}

	@Column(name = "us_username", unique = true, nullable = false, length = 40)
	public String getUsUsername() {
		return this.usUsername;
	}

	public void setUsUsername(String usUsername) {
		this.usUsername = usUsername;
	}

	@Column(name = "us_password", nullable = false, length = 40)
	public String getUsPassword() {
		return this.usPassword;
	}

	public void setUsPassword(String usPassword) {
		this.usPassword = usPassword;
	}

	@Column(name = "us_nickname", length = 50)
	public String getUsNickname() {
		return this.usNickname;
	}

	public void setUsNickname(String usNickname) {
		this.usNickname = usNickname;
	}

	@Column(name = "us_sex", length = 7)
	public String getUsSex() {
		return this.usSex;
	}

	public void setUsSex(String usSex) {
		this.usSex = usSex;
	}

	@Column(name = "us_age")
	public Integer getUsAge() {
		return this.usAge;
	}

	public void setUsAge(Integer usAge) {
		this.usAge = usAge;
	}

	@Column(name = "us_phone", nullable = false, length = 11)
	public String getUsPhone() {
		return this.usPhone;
	}

	public void setUsPhone(String usPhone) {
		this.usPhone = usPhone;
	}

	@Column(name = "us_pricture", length = 50)
	public String getUsPricture() {
		return this.usPricture;
	}

	public void setUsPricture(String usPricture) {
		this.usPricture = usPricture;
	}

	@Column(name = "us_registertime", length = 19)
	public Date getUsRegistertime() {
		return this.usRegistertime;
	}

	public void setUsRegistertime(Date usRegistertime) {
		this.usRegistertime = usRegistertime;
	}

	@Column(name = "us_lastlogintime", length = 19)
	public Date getUsLastlogintime() {
		return this.usLastlogintime;
	}

	public void setUsLastlogintime(Date usLastlogintime) {
		this.usLastlogintime = usLastlogintime;
	}

	@Column(name = "us_logouttime", length = 19)
	public Date getUsLogouttime() {
		return this.usLogouttime;
	}

	public void setUsLogouttime(Date usLogouttime) {
		this.usLogouttime = usLogouttime;
	}

	@Column(name = "us_totalonlinetime")
	public Integer getUsTotalonlinetime() {
		return this.usTotalonlinetime;
	}

	public void setUsTotalonlinetime(Integer usTotalonlinetime) {
		this.usTotalonlinetime = usTotalonlinetime;
	}

	@Column(name = "us_purchase")
	public Integer getUsPurchase() {
		return this.usPurchase;
	}

	public void setUsPurchase(Integer usPurchase) {
		this.usPurchase = usPurchase;
	}

	@Column(name = "us_storeupgoodsnum")
	public Integer getUsStoreupgoodsnum() {
		return this.usStoreupgoodsnum;
	}

	public void setUsStoreupgoodsnum(Integer usStoreupgoodsnum) {
		this.usStoreupgoodsnum = usStoreupgoodsnum;
	}

	@Column(name = "us_attentionstorenum")
	public Integer getUsAttentionstorenum() {
		return this.usAttentionstorenum;
	}

	public void setUsAttentionstorenum(Integer usAttentionstorenum) {
		this.usAttentionstorenum = usAttentionstorenum;
	}

	@Column(name = "us_exp")
	public Integer getUsExp() {
		return this.usExp;
	}

	public void setUsExp(Integer usExp) {
		this.usExp = usExp;
	}

	@Column(name = "us_buyercredit")
	public Integer getUsBuyercredit() {
		return this.usBuyercredit;
	}

	public void setUsBuyercredit(Integer usBuyercredit) {
		this.usBuyercredit = usBuyercredit;
	}

	@Column(name = "us_sellercredit")
	public Integer getUsSellercredit() {
		return this.usSellercredit;
	}

	public void setUsSellercredit(Integer usSellercredit) {
		this.usSellercredit = usSellercredit;
	}

	@Column(name = "us_lastsignin", length = 19)
	public Date getUsLastsignin() {
		return this.usLastsignin;
	}

	public void setUsLastsignin(Date usLastsignin) {
		this.usLastsignin = usLastsignin;
	}

	@Column(name = "us_storenum")
	public Integer getUsStorenum() {
		return this.usStorenum;
	}

	public void setUsStorenum(Integer usStorenum) {
		this.usStorenum = usStorenum;
	}

	@Override
	public String toString() {
		return "User [usUserid=" + usUserid + ", usUsername=" + usUsername
				+ ", usPassword=" + usPassword + ", usNickname=" + usNickname
				+ ", usSex=" + usSex + ", usAge=" + usAge + ", usPhone="
				+ usPhone + ", usPricture=" + usPricture + ", usRegistertime="
				+ usRegistertime + ", usLastlogintime=" + usLastlogintime
				+ ", usLogouttime=" + usLogouttime + ", usTotalonlinetime="
				+ usTotalonlinetime + ", usPurchase=" + usPurchase
				+ ", usStoreupgoodsnum=" + usStoreupgoodsnum
				+ ", usAttentionstorenum=" + usAttentionstorenum + ", usExp="
				+ usExp + ", usBuyercredit=" + usBuyercredit
				+ ", usSellercreit=" + usSellercredit + ", usLastsignin="
				+ usLastsignin + ", usStorenum=" + usStorenum + "]";
	}

	
	/*@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
	public Set<StoreEval> getStoreEvals() {
		return this.storeEvals;
	}

	public void setStoreEvals(Set<StoreEval> storeEvals) {
		this.storeEvals = storeEvals;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Certification> getCertifications() {
		return this.certifications;
	}

	public void setCertifications(Set<Certification> certifications) {
		this.certifications = certifications;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Storeup> getStoreups() {
		return this.storeups;
	}

	public void setStoreups(Set<Storeup> storeups) {
		this.storeups = storeups;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Order> getOrders() {
		return this.orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
	public Set<StoreEvalR> getStoreEvalRs() {
		return this.storeEvalRs;
	}

	public void setStoreEvalRs(Set<StoreEvalR> storeEvalRs) {
		this.storeEvalRs = storeEvalRs;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Attention> getAttentions() {
		return this.attentions;
	}

	public void setAttentions(Set<Attention> attentions) {
		this.attentions = attentions;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Comment_r> getComment_rs() {
		return this.comment_rs;
	}

	public void setComment_rs(Set<Comment_r> comment_rs) {
		this.comment_rs = comment_rs;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Comment> getComments() {
		return this.comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
	public Set<GoodsEvalR> getGoodsEvalRs() {
		return this.goodsEvalRs;
	}

	public void setGoodsEvalRs(Set<GoodsEvalR> goodsEvalRs) {
		this.goodsEvalRs = goodsEvalRs;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
	public Set<GoodsEval> getGoodsEvals() {
		return this.goodsEvals;
	}

	public void setGoodsEvals(Set<GoodsEval> goodsEvals) {
		this.goodsEvals = goodsEvals;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Store> getStores() {
		return this.stores;
	}

	public void setStores(Set<Store> stores) {
		this.stores = stores;
	}*/
	

}