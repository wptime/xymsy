package com.xymsy.entity;
// default package

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Order entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "tb_order", catalog = "db_xymsy")
public class Order implements java.io.Serializable {

	// Fields

	private Integer odOrderid;
	private Goods goods;
	private User user;
	private Date odCreattime;
	private Date odFinishtime;
	private double odPrice;
	private String odOrderway;
	private String odStatus;

	// Constructors

	/** default constructor */
	public Order() {
	}

	/** minimal constructor */
	public Order(Goods goods, User user, Date odCreattime, double odPrice,
			String odOrderway, String odStatus) {
		this.goods = goods;
		this.user = user;
		this.odCreattime = odCreattime;
		this.odPrice = odPrice;
		this.odOrderway = odOrderway;
		this.odStatus = odStatus;
	}

	/** full constructor */
	public Order(Goods goods, User user, Date odCreattime, Date odFinishtime,
			double odPrice, String odOrderway, String odStatus) {
		this.goods = goods;
		this.user = user;
		this.odCreattime = odCreattime;
		this.odFinishtime = odFinishtime;
		this.odPrice = odPrice;
		this.odOrderway = odOrderway;
		this.odStatus = odStatus;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "od_orderid", unique = true, nullable = false)
	public Integer getOdOrderid() {
		return this.odOrderid;
	}

	public void setOdOrderid(Integer odOrderid) {
		this.odOrderid = odOrderid;
	}

	@ManyToOne
	@JoinColumn(name = "gd_goodsid", nullable = false)
	public Goods getGoods() {
		return this.goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	@ManyToOne
	@JoinColumn(name = "us_userid", nullable = false)
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "od_creattime", nullable = false, length = 19)
	public Date getOdCreattime() {
		return this.odCreattime;
	}

	public void setOdCreattime(Date odCreattime) {
		this.odCreattime = odCreattime;
	}

	@Column(name = "od_finishtime", length = 19)
	public Date getOdFinishtime() {
		return this.odFinishtime;
	}

	public void setOdFinishtime(Date odFinishtime) {
		this.odFinishtime = odFinishtime;
	}

	@Column(name = "od_price", nullable = false, precision = 10, scale = 5)
	public double getOdPrice() {
		return this.odPrice;
	}

	public void setOdPrice(double odPrice) {
		this.odPrice = odPrice;
	}

	@Column(name = "od_orderway", nullable = false, length = 1)
	public String getOdOrderway() {
		return this.odOrderway;
	}

	public void setOdOrderway(String odOrderway) {
		this.odOrderway = odOrderway;
	}

	@Column(name = "od_status", nullable = false, length = 13)
	public String getOdStatus() {
		return this.odStatus;
	}

	public void setOdStatus(String odStatus) {
		this.odStatus = odStatus;
	}



}