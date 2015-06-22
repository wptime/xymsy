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
 * StoreEval entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "tb_store_eval", catalog = "db_xymsy")
public class StoreEval implements java.io.Serializable {

	// Fields

	private Integer selEvaluateid;
	private Store store;
	private User user;
	private Date selEvaluatetime;
	private Integer selScore;
	private String selContent;
	private String selEvaluatestatus;
	/*private Set<StoreEvalR> storeEvalRs = new HashSet<StoreEvalR>(0);*/

	// Constructors

	/** default constructor */
	public StoreEval() {
	}

	/** full constructor */
	public StoreEval(Store store, User user, Date selEvaluatetime,
			Integer selScore, String selContent, String selEvaluatestatus/*,
			Set<StoreEvalR> storeEvalRs*/) {
		this.store = store;
		this.user = user;
		this.selEvaluatetime = selEvaluatetime;
		this.selScore = selScore;
		this.selContent = selContent;
		this.selEvaluatestatus = selEvaluatestatus;
		/*this.storeEvalRs = storeEvalRs;*/
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "sel_evaluateid", unique = true, nullable = false)
	public Integer getSelEvaluateid() {
		return this.selEvaluateid;
	}

	public void setSelEvaluateid(Integer selEvaluateid) {
		this.selEvaluateid = selEvaluateid;
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

	@Column(name = "sel_evaluatetime", length = 19)
	public Date getSelEvaluatetime() {
		return this.selEvaluatetime;
	}

	public void setSelEvaluatetime(Date selEvaluatetime) {
		this.selEvaluatetime = selEvaluatetime;
	}

	@Column(name = "sel_score")
	public Integer getSelScore() {
		return this.selScore;
	}

	public void setSelScore(Integer selScore) {
		this.selScore = selScore;
	}

	@Column(name = "sel_content", length = 400)
	public String getSelContent() {
		return this.selContent;
	}

	public void setSelContent(String selContent) {
		this.selContent = selContent;
	}

	@Column(name = "sel_evaluatestatus", length = 1)
	public String getSelEvaluatestatus() {
		return this.selEvaluatestatus;
	}

	public void setSelEvaluatestatus(String selEvaluatestatus) {
		this.selEvaluatestatus = selEvaluatestatus;
	}

	/*@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "storeEval")
	public Set<StoreEvalR> getStoreEvalRs() {
		return this.storeEvalRs;
	}

	public void setStoreEvalRs(Set<StoreEvalR> storeEvalRs) {
		this.storeEvalRs = storeEvalRs;
	}*/

}