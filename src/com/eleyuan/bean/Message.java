package com.eleyuan.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.eleyuan.util.HtmlConverter;

/**
 * 成员实体对像
 */
@Entity
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE, region="message")
@org.hibernate.annotations.Entity(dynamicUpdate=true)
public class Message implements java.io.Serializable {

	private static final long serialVersionUID = -5899703145234269569L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;


	@Column(length = 20)
	private String username;

	@Column(length = 20)
	private String reciever;
	
	public void setTime(String time) {
		this.time = time;
	}

	@Column(length = 1024)
	private String content;
	
	@Column(length = 25)
	private String time;
	// Constructors

	/**
	 * default constructor
	 */
	public Message() {
	}

	/**
	 * constructor
	 */
	public Message(String content, String time, String reciever, String username) {
/*		this.title = title;*/
		this.content = content;
		this.time=time;
		this.reciever = reciever;
		this.username = username;
		
		
	}



	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
 
 
	public String getReciever() {
		return this.reciever;
	}

	public void setReciever(String reciever) {
		this.reciever = reciever;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTime() {
		return this.time;
	}

	public void setGrade(String time) {
		this.time = time;
	}

	

}
