package com.eleyuan.bean;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;


/**
 * ��Աʵ�����博客
 */
@Entity
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE, region="posttopic")
@org.hibernate.annotations.Entity(dynamicUpdate=true)
public class Posttopic implements java.io.Serializable {

	private static final long serialVersionUID = -5899703145234269569L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	public void setContext(String context) {
		this.context = context;
	}

	@Column(length =300)
	private String context;    //博客内容


	@Column(length = 40)
	private String username;    //博客作者,外键关联



	@Column(length = 45)
	private String time;


	

	// Constructors

	/**
	 * default constructor
	 */
	public Posttopic() {
		
		
	}

	/**
	 * minimal constructor
	 */
	public Posttopic(String context, String username, String time) {
		this.context = context;
		this.username = username;
		this.time = time;

 
	}



 // Property accessors


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getContext() {
		return context;
	}

	public void setContent(String content) {
		this.context = content;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}



}