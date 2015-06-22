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
 * Comment entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "tb_comment", catalog = "db_xymsy")
public class Comment implements java.io.Serializable {

	// Fields

	private Integer ctCommentid;
	private Goods goods;
	private User user;
	private Date ctCommenttime;
	private String ctIsbuy;
	private String ctContent;
	private String ctCommentstatus;
//	private Set<Comment_r> comment_rs = new HashSet<Comment_r>(0);

	// Constructors

	/** default constructor */
	public Comment() {
	}

	/** full constructor */
	public Comment(Goods goods, User user, Date ctCommenttime, String ctIsbuy,
			String ctContent, String ctCommentstatus/*, Set<Comment_r> comment_rs*/) {
		this.goods = goods;
		this.user = user;
		this.ctCommenttime = ctCommenttime;
		this.ctIsbuy = ctIsbuy;
		this.ctContent = ctContent;
		this.ctCommentstatus = ctCommentstatus;
//		this.comment_rs = comment_rs;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "ct_commentid", unique = true, nullable = false)
	public Integer getCtCommentid() {
		return this.ctCommentid;
	}

	public void setCtCommentid(Integer ctCommentid) {
		this.ctCommentid = ctCommentid;
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

	@Column(name = "ct_commenttime", length = 19)
	public Date getCtCommenttime() {
		return this.ctCommenttime;
	}

	public void setCtCommenttime(Date ctCommenttime) {
		this.ctCommenttime = ctCommenttime;
	}

	@Column(name = "ct_isbuy", length = 1)
	public String getCtIsbuy() {
		return this.ctIsbuy;
	}

	public void setCtIsbuy(String ctIsbuy) {
		this.ctIsbuy = ctIsbuy;
	}

	@Column(name = "ct_content", length = 400)
	public String getCtContent() {
		return this.ctContent;
	}

	public void setCtContent(String ctContent) {
		this.ctContent = ctContent;
	}

	@Column(name = "ct_commentstatus", length = 1)
	public String getCtCommentstatus() {
		return this.ctCommentstatus;
	}

	public void setCtCommentstatus(String ctCommentstatus) {
		this.ctCommentstatus = ctCommentstatus;
	}

	/*@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "comment")
	public Set<Comment_r> getComment_rs() {
		return this.comment_rs;
	}

	public void setComment_rs(Set<Comment_r> comment_rs) {
		this.comment_rs = comment_rs;
	}*/

}