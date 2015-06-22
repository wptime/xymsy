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
 * GoodsEval entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "tb_goods_eval", catalog = "db_xymsy")
public class GoodsEval implements java.io.Serializable {

	// Fields

	private Integer gelEvaluateid;
	private Goods goods;
	private User user;
	private Date gelEvaluatetime;
	private Integer gelScore;
	private String gelContent;
	private String gelEvaluatestatus;
//	private Set<GoodsEvalR> goodsEvalRs = new HashSet<GoodsEvalR>(0);

	// Constructors

	/** default constructor */
	public GoodsEval() {
	}

	/** full constructor */
	public GoodsEval(Goods goods, User user, Date gelEvaluatetime,
			Integer gelScore, String gelContent/*, String gelEvaluatestatus,
			Set<GoodsEvalR> goodsEvalRs*/) {
		this.goods = goods;
		this.user = user;
		this.gelEvaluatetime = gelEvaluatetime;
		this.gelScore = gelScore;
		this.gelContent = gelContent;
		this.gelEvaluatestatus = gelEvaluatestatus;
//		this.goodsEvalRs = goodsEvalRs;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "gel_evaluateid", unique = true, nullable = false)
	public Integer getGelEvaluateid() {
		return this.gelEvaluateid;
	}

	public void setGelEvaluateid(Integer gelEvaluateid) {
		this.gelEvaluateid = gelEvaluateid;
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

	@Column(name = "gel_evaluatetime", length = 19)
	public Date getGelEvaluatetime() {
		return this.gelEvaluatetime;
	}

	public void setGelEvaluatetime(Date gelEvaluatetime) {
		this.gelEvaluatetime = gelEvaluatetime;
	}

	@Column(name = "gel_score")
	public Integer getGelScore() {
		return this.gelScore;
	}

	public void setGelScore(Integer gelScore) {
		this.gelScore = gelScore;
	}

	@Column(name = "gel_content", length = 400)
	public String getGelContent() {
		return this.gelContent;
	}

	public void setGelContent(String gelContent) {
		this.gelContent = gelContent;
	}

	@Column(name = "gel_evaluatestatus", length = 1)
	public String getGelEvaluatestatus() {
		return this.gelEvaluatestatus;
	}

	public void setGelEvaluatestatus(String gelEvaluatestatus) {
		this.gelEvaluatestatus = gelEvaluatestatus;
	}

	/*@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "goodsEval")
	public Set<GoodsEvalR> getGoodsEvalRs() {
		return this.goodsEvalRs;
	}

	public void setGoodsEvalRs(Set<GoodsEvalR> goodsEvalRs) {
		this.goodsEvalRs = goodsEvalRs;
	}*/

}