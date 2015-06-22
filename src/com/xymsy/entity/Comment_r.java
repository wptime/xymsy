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
 * Comment_r entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "tb_comment_r", catalog = "db_xymsy")
public class Comment_r implements java.io.Serializable {

	// Fields

	private Integer ctrCtreplyid;
	private User user;
	private Comment comment;
	private Date ctrCtreplytime;
	private String ctrContent;
	private String ctrCtreplystatus;

	// Constructors

	/** default constructor */
	public Comment_r() {
	}

	/** full constructor */
	public Comment_r(User user, Comment comment, Date ctrCtreplytime,
			String ctrContent, String ctrCtreplystatus) {
		this.user = user;
		this.comment = comment;
		this.ctrCtreplytime = ctrCtreplytime;
		this.ctrContent = ctrContent;
		this.ctrCtreplystatus = ctrCtreplystatus;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "ctr_ctreplyid", unique = true, nullable = false)
	public Integer getCtrCtreplyid() {
		return this.ctrCtreplyid;
	}

	public void setCtrCtreplyid(Integer ctrCtreplyid) {
		this.ctrCtreplyid = ctrCtreplyid;
	}

	@ManyToOne
	@JoinColumn(name = "us_submituserid")
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@ManyToOne
	@JoinColumn(name = "ct_commentid")
	public Comment getComment() {
		return this.comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	@Column(name = "ctr_ctreplytime", length = 19)
	public Date getCtrCtreplytime() {
		return this.ctrCtreplytime;
	}

	public void setCtrCtreplytime(Date ctrCtreplytime) {
		this.ctrCtreplytime = ctrCtreplytime;
	}

	@Column(name = "ctr_content", length = 400)
	public String getCtrContent() {
		return this.ctrContent;
	}

	public void setCtrContent(String ctrContent) {
		this.ctrContent = ctrContent;
	}

	@Column(name = "ctr_ctreplystatus", length = 1)
	public String getCtrCtreplystatus() {
		return this.ctrCtreplystatus;
	}

	public void setCtrCtreplystatus(String ctrCtreplystatus) {
		this.ctrCtreplystatus = ctrCtreplystatus;
	}

}