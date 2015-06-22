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
 * Goods entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "tb_goods", catalog = "db_xymsy")
public class Goods implements java.io.Serializable {

	// Fields

	private Integer gdGoodsid;
	private Store store;
	private String gdGoodsname;
	private String gdPicture;
	private String gdBrief;
	private String gdInfo;
	private Integer gdSum;
	private double gdPrice;
	private String gdStatus;
	private Date gdCreatetime;
	private Date gdSaletime;
	private String gdKind;
	private String gdTag;
	private Integer gdClicked;
	private Integer gdSaled;
	private Integer gdStoreupnum;
	/*private Set<Storeup> storeups = new HashSet<Storeup>(0);
	private Set<Order> orders = new HashSet<Order>(0);
	private Set<Comment> comments = new HashSet<Comment>(0);*/

	// Constructors

	/** default constructor */
	public Goods() {
	}

	/** minimal constructor */
	public Goods(Integer gdSum, double gdPrice, String gdStatus) {
		this.gdSum = gdSum;
		this.gdPrice = gdPrice;
		this.gdStatus = gdStatus;
	}

	/** full constructor */
	public Goods(Store store, String gdGoodsname, String gdPicture,
			String gdBrief, String gdInfo, Integer gdSum, double gdPrice,
			String gdStatus, Date gdCreatetime, Date gdSaletime, String gdKind,
			String gdTag, Integer gdClicked, Integer gdSaled,
			Integer gdStoreupnum/*, Set<Storeup> storeups, Set<Order> orders,
			Set<Comment> comments*/) {
		this.store = store;
		this.gdGoodsname = gdGoodsname;
		this.gdPicture = gdPicture;
		this.gdBrief = gdBrief;
		this.gdInfo = gdInfo;
		this.gdSum = gdSum;
		this.gdPrice = gdPrice;
		this.gdStatus = gdStatus;
		this.gdCreatetime = gdCreatetime;
		this.gdSaletime = gdSaletime;
		this.gdKind = gdKind;
		this.gdTag = gdTag;
		this.gdClicked = gdClicked;
		this.gdSaled = gdSaled;
		this.gdStoreupnum = gdStoreupnum;
//		this.storeups = storeups;
//		this.orders = orders;
//		this.comments = comments;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "gd_goodsid", unique = true, nullable = false)
	public Integer getGdGoodsid() {
		return this.gdGoodsid;
	}

	public void setGdGoodsid(Integer gdGoodsid) {
		this.gdGoodsid = gdGoodsid;
	}

	@ManyToOne
	@JoinColumn(name = "st_storeid")
	public Store getStore() {
		return this.store;
	}

	public void setStore(Store store) {
		this.store = store;
	}

	@Column(name = "gd_goodsname", length = 50)
	public String getGdGoodsname() {
		return this.gdGoodsname;
	}

	public void setGdGoodsname(String gdGoodsname) {
		this.gdGoodsname = gdGoodsname;
	}

	@Column(name = "gd_picture", length = 500)
	public String getGdPicture() {
		return this.gdPicture;
	}

	public void setGdPicture(String gdPicture) {
		this.gdPicture = gdPicture;
	}

	@Column(name = "gd_brief", length = 230)
	public String getGdBrief() {
		return this.gdBrief;
	}

	public void setGdBrief(String gdBrief) {
		this.gdBrief = gdBrief;
	}

	@Column(name = "gd_info", length = 10000)
	public String getGdInfo() {
		return this.gdInfo;
	}

	public void setGdInfo(String gdInfo) {
		this.gdInfo = gdInfo;
	}

	@Column(name = "gd_sum", nullable = false)
	public Integer getGdSum() {
		return this.gdSum;
	}

	public void setGdSum(Integer gdSum) {
		this.gdSum = gdSum;
	}

	@Column(name = "gd_price", nullable = false, precision = 10, scale = 5)
	public double getGdPrice() {
		return this.gdPrice;
	}

	public void setGdPrice(double gdPrice) {
		this.gdPrice = gdPrice;
	}

	@Column(name = "gd_status", nullable = false, length = 9)
	public String getGdStatus() {
		return this.gdStatus;
	}

	public void setGdStatus(String gdStatus) {
		this.gdStatus = gdStatus;
	}

	@Column(name = "gd_createtime", length = 19)
	public Date getGdCreatetime() {
		return this.gdCreatetime;
	}

	public void setGdCreatetime(Date gdCreatetime) {
		this.gdCreatetime = gdCreatetime;
	}

	@Column(name = "gd_saletime", length = 19)
	public Date getGdSaletime() {
		return this.gdSaletime;
	}

	public void setGdSaletime(Date gdSaletime) {
		this.gdSaletime = gdSaletime;
	}

	@Column(name = "gd_kind", length = 50)
	public String getGdKind() {
		return this.gdKind;
	}

	public void setGdKind(String gdKind) {
		this.gdKind = gdKind;
	}

	@Column(name = "gd_tag", length = 50)
	public String getGdTag() {
		return this.gdTag;
	}

	public void setGdTag(String gdTag) {
		this.gdTag = gdTag;
	}

	@Column(name = "gd_clicked")
	public Integer getGdClicked() {
		return this.gdClicked;
	}

	public void setGdClicked(Integer gdClicked) {
		this.gdClicked = gdClicked;
	}

	@Column(name = "gd_saled")
	public Integer getGdSaled() {
		return this.gdSaled;
	}

	public void setGdSaled(Integer gdSaled) {
		this.gdSaled = gdSaled;
	}

	@Column(name = "gd_storeupnum")
	public Integer getGdStoreupnum() {
		return this.gdStoreupnum;
	}

	public void setGdStoreupnum(Integer gdStoreupnum) {
		this.gdStoreupnum = gdStoreupnum;
	}

	@Override
	public String toString() {
		return "Goods [gdGoodsid=" + gdGoodsid + ", store=" + store
				+ ", gdGoodsname=" + gdGoodsname + ", gdPicture=" + gdPicture
				+ ", gdBrief=" + gdBrief + ", gdInfo=" + gdInfo + ", gdSum="
				+ gdSum + ", gdPrice=" + gdPrice + ", gdStatus=" + gdStatus
				+ ", gdCreatetime=" + gdCreatetime + ", gdSaletime="
				+ gdSaletime + ", gdKind=" + gdKind + ", gdTag=" + gdTag
				+ ", gdClicked=" + gdClicked + ", gdSaled=" + gdSaled
				+ ", gdStoreupnum=" + gdStoreupnum + "]";
	}

	/*@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "goods")
	public Set<Storeup> getStoreups() {
		return this.storeups;
	}

	public void setStoreups(Set<Storeup> storeups) {
		this.storeups = storeups;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "goods")
	public Set<Order> getOrders() {
		return this.orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "goods")
	public Set<Comment> getComments() {
		return this.comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}*/

}