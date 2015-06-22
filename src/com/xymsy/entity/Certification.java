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
 * Certification entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "tb_certification", catalog = "db_xymsy")
public class Certification implements java.io.Serializable {

	// Fields

	private Integer ctCertificationid;
	private User user;
	private Date ctCreatetime;
	private Date ctFinishtime;
	private String ctRealname;
	private String ctStudentid;
	private String ctGrade;
	private String ctAddress;
	private String ctSchool;
	private String ctMajor;
	private String ctStatus;

	// Constructors

	/** default constructor */
	public Certification() {
	}

	/** full constructor */
	public Certification(User user, Date ctCreatetime, Date ctFinishtime,
			String ctRealname, String ctStudentid, String ctGrade,
			String ctAddress, String ctSchool, String ctMajor, String ctStatus) {
		this.user = user;
		this.ctCreatetime = ctCreatetime;
		this.ctFinishtime = ctFinishtime;
		this.ctRealname = ctRealname;
		this.ctStudentid = ctStudentid;
		this.ctGrade = ctGrade;
		this.ctAddress = ctAddress;
		this.ctSchool = ctSchool;
		this.ctMajor = ctMajor;
		this.ctStatus = ctStatus;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "ct_certificationid", unique = true, nullable = false)
	public Integer getCtCertificationid() {
		return this.ctCertificationid;
	}

	public void setCtCertificationid(Integer ctCertificationid) {
		this.ctCertificationid = ctCertificationid;
	}

	@ManyToOne
	@JoinColumn(name = "us_userid")
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "ct_createtime", length = 19)
	public Date getCtCreatetime() {
		return this.ctCreatetime;
	}

	public void setCtCreatetime(Date ctCreatetime) {
		this.ctCreatetime = ctCreatetime;
	}

	@Column(name = "ct_finishtime", length = 19)
	public Date getCtFinishtime() {
		return this.ctFinishtime;
	}

	public void setCtFinishtime(Date ctFinishtime) {
		this.ctFinishtime = ctFinishtime;
	}

	@Column(name = "ct_realname", length = 20)
	public String getCtRealname() {
		return this.ctRealname;
	}

	public void setCtRealname(String ctRealname) {
		this.ctRealname = ctRealname;
	}

	@Column(name = "ct_studentid", length = 20)
	public String getCtStudentid() {
		return this.ctStudentid;
	}

	public void setCtStudentid(String ctStudentid) {
		this.ctStudentid = ctStudentid;
	}

	@Column(name = "ct_grade", length = 20)
	public String getCtGrade() {
		return this.ctGrade;
	}

	public void setCtGrade(String ctGrade) {
		this.ctGrade = ctGrade;
	}

	@Column(name = "ct_address", length = 80)
	public String getCtAddress() {
		return this.ctAddress;
	}

	public void setCtAddress(String ctAddress) {
		this.ctAddress = ctAddress;
	}

	@Column(name = "ct_school", length = 50)
	public String getCtSchool() {
		return this.ctSchool;
	}

	public void setCtSchool(String ctSchool) {
		this.ctSchool = ctSchool;
	}

	@Column(name = "ct_major", length = 20)
	public String getCtMajor() {
		return this.ctMajor;
	}

	public void setCtMajor(String ctMajor) {
		this.ctMajor = ctMajor;
	}

	@Column(name = "ct_status", length = 1)
	public String getCtStatus() {
		return this.ctStatus;
	}

	public void setCtStatus(String ctStatus) {
		this.ctStatus = ctStatus;
	}

}