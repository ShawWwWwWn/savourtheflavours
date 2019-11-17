package com.fdmgroup.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="authorities")
@NamedQuery(name = "findAuthorityId", query = "SELECT a FROM Authority a WHERE a.username = :uName")
@NamedQuery(name = "updateAuthority", query = "UPDATE Authority a set a.username = :uName where a.authId= :authId ")
public class Authority implements IStorable{

	@Id
	@GeneratedValue (strategy = GenerationType.SEQUENCE , generator = "AUTHORITY_SEQUENCE")
	@SequenceGenerator (name = "AUTHORITY_SEQUENCE", sequenceName = "AUTHORITY_SEQ", allocationSize = 1)
	@Column (nullable = false, updatable = false, length = 5, unique = true)
	
	private int authId;
	
	public int getAuthId() {
		return authId;
	}

	public void setAuthId(int authId) {
		this.authId = authId;
	}

	private String username;
	private String authority;
	
	public Authority(String username, String authority) {
		super();
		this.username = username;
		this.authority = authority;
	}

	public Authority() {
		super();
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	@Override
	public String toString() {
		return "Authority [username=" + username + ", authority=" + authority + "]";
	}
	
	
}
