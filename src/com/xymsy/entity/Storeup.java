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
 * Storeup entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "tb_storeup", catalog = "db_xymsy")
public class Storeup implements java.io.Serializable {

	// Fields

	private Integer suStoreup;
	private Goods goods;
	private User user;
	private Date suCreatetime;
	private Date cuDeletetime;

	// Constructors

	/** default constructor */
	public Storeup() {
	}

	/** full constructor */
	public Storeup(Goods goods, User user, Date suCreatetime, Date cuDeletetime) {
		this.goods = goods;
		this.user = user;
		this.suCreatetime = suCreatetime;
		this.cuDeletetime = cuDeletetime;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "su_storeup", unique = true, nullable = false)
	public Integer getSuStoreup() {
		return this.suStoreup;
	}

	public void setSuStoreup(Integer suStoreup) {
		this.suStoreup = suStoreup;
	}

	@ManyToOne
	@JoinColumn(name = "gd_goodsid")
	public Goods getGoods() {
		return this.goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	@ManyToOne
	@JoinColumn(name = "us_userid")
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "su_createtime", length = 19)
	public Date getSuCreatetime() {
		return this.suCreatetime;
	}

	public void setSuCreatetime(Date suCreatetime) {
		this.suCreatetime = suCreatetime;
	}

	@Column(name = "cu_deletetime", length = 19)
	public Date getCuDeletetime() {
		return this.cuDeletetime;
	}

	public void setCuDeletetime(Date cuDeletetime) {
		this.cuDeletetime = cuDeletetime;
	}

}