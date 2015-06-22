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
 * StoreEvalR entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "tb_store_eval_r", catalog = "db_xymsy")
public class StoreEvalR implements java.io.Serializable {

	// Fields

	private Integer sevrEvreplyid;
	private StoreEval storeEval;
	private User user;
	private Date sevrEvreplytime;
	private String sevrContent;
	private String sevrEvreplystatus;

	// Constructors

	/** default constructor */
	public StoreEvalR() {
	}

	/** full constructor */
	public StoreEvalR(StoreEval storeEval, User user, Date sevrEvreplytime,
			String sevrContent, String sevrEvreplystatus) {
		this.storeEval = storeEval;
		this.user = user;
		this.sevrEvreplytime = sevrEvreplytime;
		this.sevrContent = sevrContent;
		this.sevrEvreplystatus = sevrEvreplystatus;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "sevr_evreplyid", unique = true, nullable = false)
	public Integer getSevrEvreplyid() {
		return this.sevrEvreplyid;
	}

	public void setSevrEvreplyid(Integer sevrEvreplyid) {
		this.sevrEvreplyid = sevrEvreplyid;
	}

	@ManyToOne
	@JoinColumn(name = "sel_evaluateid")
	public StoreEval getStoreEval() {
		return this.storeEval;
	}

	public void setStoreEval(StoreEval storeEval) {
		this.storeEval = storeEval;
	}

	@ManyToOne
	@JoinColumn(name = "us_submituserid")
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "sevr_evreplytime", length = 19)
	public Date getSevrEvreplytime() {
		return this.sevrEvreplytime;
	}

	public void setSevrEvreplytime(Date sevrEvreplytime) {
		this.sevrEvreplytime = sevrEvreplytime;
	}

	@Column(name = "sevr_content", length = 400)
	public String getSevrContent() {
		return this.sevrContent;
	}

	public void setSevrContent(String sevrContent) {
		this.sevrContent = sevrContent;
	}

	@Column(name = "sevr_evreplystatus", length = 1)
	public String getSevrEvreplystatus() {
		return this.sevrEvreplystatus;
	}

	public void setSevrEvreplystatus(String sevrEvreplystatus) {
		this.sevrEvreplystatus = sevrEvreplystatus;
	}

}