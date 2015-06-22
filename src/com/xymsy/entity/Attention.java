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
 * Attention entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "tb_attention", catalog = "db_xymsy")
public class Attention implements java.io.Serializable {

	// Fields

	private Integer atAttentionid;
	private Store store;
	private User user;
	private Date atCreatetime;
	private Date atDeletetime;

	// Constructors

	/** default constructor */
	public Attention() {
	}

	/** full constructor */
	public Attention(Store store, User user, Date atCreatetime,
			Date atDeletetime) {
		this.store = store;
		this.user = user;
		this.atCreatetime = atCreatetime;
		this.atDeletetime = atDeletetime;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "at_attentionid", unique = true, nullable = false)
	public Integer getAtAttentionid() {
		return this.atAttentionid;
	}

	public void setAtAttentionid(Integer atAttentionid) {
		this.atAttentionid = atAttentionid;
	}

	@ManyToOne
	@JoinColumn(name = "st_storeid")
	public Store getStore() {
		return this.store;
	}

	public void setStore(Store store) {
		this.store = store;
	}

	@ManyToOne
	@JoinColumn(name = "us_userid")
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "at_createtime", length = 19)
	public Date getAtCreatetime() {
		return this.atCreatetime;
	}

	public void setAtCreatetime(Date atCreatetime) {
		this.atCreatetime = atCreatetime;
	}

	@Column(name = "at_deletetime", length = 19)
	public Date getAtDeletetime() {
		return this.atDeletetime;
	}

	public void setAtDeletetime(Date atDeletetime) {
		this.atDeletetime = atDeletetime;
	}

}