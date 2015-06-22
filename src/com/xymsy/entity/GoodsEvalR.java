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
 * GoodsEvalR entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "tb_goods_eval_r", catalog = "db_xymsy")
public class GoodsEvalR implements java.io.Serializable {

	// Fields

	private Integer gevrEverplyid;
	private GoodsEval goodsEval;
	private User user;
	private Date gevrEvreplytime;
	private String gevrContent;
	private String grvrEvreplystatus;

	// Constructors

	/** default constructor */
	public GoodsEvalR() {
	}

	/** full constructor */
	public GoodsEvalR(GoodsEval goodsEval, User user, Date gevrEvreplytime,
			String gevrContent, String grvrEvreplystatus) {
		this.goodsEval = goodsEval;
		this.user = user;
		this.gevrEvreplytime = gevrEvreplytime;
		this.gevrContent = gevrContent;
		this.grvrEvreplystatus = grvrEvreplystatus;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "gevr_everplyid", unique = true, nullable = false)
	public Integer getGevrEverplyid() {
		return this.gevrEverplyid;
	}

	public void setGevrEverplyid(Integer gevrEverplyid) {
		this.gevrEverplyid = gevrEverplyid;
	}

	@ManyToOne
	@JoinColumn(name = "gel_evaluateid")
	public GoodsEval getGoodsEval() {
		return this.goodsEval;
	}

	public void setGoodsEval(GoodsEval goodsEval) {
		this.goodsEval = goodsEval;
	}

	@ManyToOne
	@JoinColumn(name = "us_submituserid")
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "gevr_evreplytime", length = 19)
	public Date getGevrEvreplytime() {
		return this.gevrEvreplytime;
	}

	public void setGevrEvreplytime(Date gevrEvreplytime) {
		this.gevrEvreplytime = gevrEvreplytime;
	}

	@Column(name = "gevr_content", length = 400)
	public String getGevrContent() {
		return this.gevrContent;
	}

	public void setGevrContent(String gevrContent) {
		this.gevrContent = gevrContent;
	}

	@Column(name = "grvr_evreplystatus", length = 1)
	public String getGrvrEvreplystatus() {
		return this.grvrEvreplystatus;
	}

	public void setGrvrEvreplystatus(String grvrEvreplystatus) {
		this.grvrEvreplystatus = grvrEvreplystatus;
	}

}