package com.xymsy.entity;
// default package

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Admin entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "tb_admin", catalog = "db_xymsy")
public class Admin implements java.io.Serializable {

	// Fields

	private Integer adAdminid;
	private String adUsername;
	private String adPassword;
	private Integer adPermission;
	private Date adLastlogintime;

	// Constructors

	/** default constructor */
	public Admin() {
	}

	/** minimal constructor */
	public Admin(String adUsername, String adPassword) {
		this.adUsername = adUsername;
		this.adPassword = adPassword;
	}

	/** full constructor */
	public Admin(String adUsername, String adPassword, Integer adPermission,
			Date adLastlogintime) {
		this.adUsername = adUsername;
		this.adPassword = adPassword;
		this.adPermission = adPermission;
		this.adLastlogintime = adLastlogintime;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "ad_adminid", unique = true, nullable = false)
	public Integer getAdAdminid() {
		return this.adAdminid;
	}

	public void setAdAdminid(Integer adAdminid) {
		this.adAdminid = adAdminid;
	}

	@Column(name = "ad_username", nullable = false, length = 20)
	public String getAdUsername() {
		return this.adUsername;
	}

	public void setAdUsername(String adUsername) {
		this.adUsername = adUsername;
	}

	@Column(name = "ad_password", nullable = false, length = 20)
	public String getAdPassword() {
		return this.adPassword;
	}

	public void setAdPassword(String adPassword) {
		this.adPassword = adPassword;
	}

	@Column(name = "ad_permission")
	public Integer getAdPermission() {
		return this.adPermission;
	}

	public void setAdPermission(Integer adPermission) {
		this.adPermission = adPermission;
	}

	@Column(name = "ad_lastlogintime", length = 19)
	public Date getAdLastlogintime() {
		return this.adLastlogintime;
	}

	public void setAdLastlogintime(Date adLastlogintime) {
		this.adLastlogintime = adLastlogintime;
	}

}