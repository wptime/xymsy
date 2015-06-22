package com.xymsy.entity;
// default package

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
 * Kinds entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "tb_kinds", catalog = "db_xymsy")
public class Kinds implements java.io.Serializable {

	// Fields

	private Integer kdId;
	private Kinds kinds;
	private String kdKind;
	/*private Set<Kinds> kindses = new HashSet<Kinds>(0);*/

	// Constructors

	/** default constructor */
	public Kinds() {
	}

	/** full constructor */
	public Kinds(Kinds kinds, String kdKind/*, Set<Kinds> kindses*/) {
		this.kinds = kinds;
		this.kdKind = kdKind;
		/*this.kindses = kindses;*/
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "kd_id", unique = true, nullable = false)
	public Integer getKdId() {
		return this.kdId;
	}

	public void setKdId(Integer kdId) {
		this.kdId = kdId;
	}

	@ManyToOne
	@JoinColumn(name = "kd_parentkind")
	public Kinds getKinds() {
		return this.kinds;
	}

	public void setKinds(Kinds kinds) {
		this.kinds = kinds;
	}

	@Column(name = "kd_kind", length = 20)
	public String getKdKind() {
		return this.kdKind;
	}

	public void setKdKind(String kdKind) {
		this.kdKind = kdKind;
	}

	/*@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "kinds")
	public Set<Kinds> getKindses() {
		return this.kindses;
	}

	public void setKindses(Set<Kinds> kindses) {
		this.kindses = kindses;
	}*/

}