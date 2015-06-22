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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Store entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "tb_store", catalog = "db_xymsy")
public class Store implements java.io.Serializable {

	// Fields

	private Integer stStoreid;
	private User user;
	private String stStorename;
	private Date stCreatetime;
	private String stStorestatus;
	private Integer stGoodsnum;
	private Integer stAttentionnum;
	private Integer stScore;
	private String stMain;
	private String stStoreadd;
	private String stPicture;
	/*private Set<StoreEval> storeEvals = new HashSet<StoreEval>(0);
	private Set<Goods> goodses = new HashSet<Goods>(0);
	private Set<Attention> attentions = new HashSet<Attention>(0);
	private Set<GoodsEval> goodsEvals = new HashSet<GoodsEval>(0);*/

	// Constructors

	/** default constructor */
	public Store() {
	}

	/** full constructor */
	public Store(User user, String stStorename, Date stCreatetime,
			String stStorestatus, Integer stGoodsnum, Integer stAttentionnum,
			Integer stScore, String stMain/*, Set<StoreEval> storeEvals,
			Set<Goods> goodses, Set<Attention> attentions,
			Set<GoodsEval> goodsEvals*/) {
		this.user = user;
		this.stStorename = stStorename;
		this.stCreatetime = stCreatetime;
		this.stStorestatus = stStorestatus;
		this.stGoodsnum = stGoodsnum;
		this.stAttentionnum = stAttentionnum;
		this.stScore = stScore;
		this.stMain = stMain;
		this.stStoreadd = "";
		this.stPicture = "";
	/*	this.storeEvals = storeEvals;
		this.goodses = goodses;
		this.attentions = attentions;
		this.goodsEvals = goodsEvals;*/
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "st_storeid", unique = true, nullable = false)
	public Integer getStStoreid() {
		return this.stStoreid;
	}

	public void setStStoreid(Integer stStoreid) {
		this.stStoreid = stStoreid;
	}

	@ManyToOne
	@JoinColumn(name = "us_userid")
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "st_storename", length = 50)
	public String getStStorename() {
		return this.stStorename;
	}

	public void setStStorename(String stStorename) {
		this.stStorename = stStorename;
	}

	@Column(name = "st_createtime", length = 19)
	public Date getStCreatetime() {
		return this.stCreatetime;
	}

	public void setStCreatetime(Date stCreatetime) {
		this.stCreatetime = stCreatetime;
	}

	@Column(name = "st_storestatus", length = 1)
	public String getStStorestatus() {
		return this.stStorestatus;
	}

	public void setStStorestatus(String stStorestatus) {
		this.stStorestatus = stStorestatus;
	}

	@Column(name = "st_goodsnum")
	public Integer getStGoodsnum() {
		return this.stGoodsnum;
	}

	public void setStGoodsnum(Integer stGoodsnum) {
		this.stGoodsnum = stGoodsnum;
	}

	@Column(name = "st_attentionnum")
	public Integer getStAttentionnum() {
		return this.stAttentionnum;
	}

	public void setStAttentionnum(Integer stAttentionnum) {
		this.stAttentionnum = stAttentionnum;
	}

	@Column(name = "st_score")
	public Integer getStScore() {
		return this.stScore;
	}

	public void setStScore(Integer stScore) {
		this.stScore = stScore;
	}

	@Column(name = "st_main", length = 30)
	public String getStMain() {
		return this.stMain;
	}

	public void setStMain(String stMain) {
		this.stMain = stMain;
	}
	
	@Column(name = "st_storeadd", length = 200)
	public String getStStoreadd() {
		return this.stStoreadd;
	}

	public void setStStoreadd(String stStoreadd) {
		this.stStoreadd = stStoreadd;
	}
	
	@Column(name = "st_picture", length = 30)
	public String getStPicture() {
		return this.stPicture;
	}

	public void setStPicture(String stPicture) {
		this.stPicture = stPicture;
	}

	/*@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "store")
	public Set<StoreEval> getStoreEvals() {
		return this.storeEvals;
	}

	public void setStoreEvals(Set<StoreEval> storeEvals) {
		this.storeEvals = storeEvals;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "store")
	public Set<Goods> getGoodses() {
		return this.goodses;
	}

	public void setGoodses(Set<Goods> goodses) {
		this.goodses = goodses;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "store")
	public Set<Attention> getAttentions() {
		return this.attentions;
	}

	public void setAttentions(Set<Attention> attentions) {
		this.attentions = attentions;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "store")
	public Set<GoodsEval> getGoodsEvals() {
		return this.goodsEvals;
	}

	public void setGoodsEvals(Set<GoodsEval> goodsEvals) {
		this.goodsEvals = goodsEvals;
	}*/

}