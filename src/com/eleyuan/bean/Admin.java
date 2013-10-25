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
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE, region="admin")
@org.hibernate.annotations.Entity(dynamicUpdate=true)
public class Admin implements java.io.Serializable {

	private static final long serialVersionUID = -5899703145234269569L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@Column(length = 4, nullable = false)
	private String type;

	@Column(length = 4)
	private String title;

	@Column(length = 8, nullable = false)
	private String username;

	@Column(length = 1)
	private String sex;

	@Column(length = 45, nullable = false)
	private String password;

	@Column(length = 10)
	private String grade;

	@Column(length = 20, name = "class")
	private String class_;

	@Column(length = 45)
	private String email;

	@Column(length = 15)
	private String phone;

	@Column(length = 512)
	private String motto;

	@Column(length = 1024)
	private String profile;

	// Constructors

	/**
	 * default constructor
	 */
	public Admin() {
	}

	/**
	 * minimal constructor
	 */
	public Admin(String type, String username, String sex, String password,
			String grade, String class_, String email, String profile) {
		this.type = type;
		this.username = username;
		this.sex = sex;
		this.password = password;
		this.grade = grade;
		this.class_ = class_;
		this.email = email;
		this.profile = profile;
	}

	/**
	 * full constructor
	 */
	public Admin(String type, String username, String sex, String password,
			String grade, String class_, String email, String phone,
			String profile, String headIcon) {
		this.type = type;
		this.username = username;
		this.sex = sex;
		this.password = password;
		this.grade = grade;
		this.class_ = class_;
		this.email = email;
		this.phone = phone;
		this.profile = profile;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGrade() {
		return this.grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getClass_() {
		return this.class_;
	}

	public void setClass_(String class_) {
		this.class_ = class_;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMotto() {
		return motto;
	}

	public void setMotto(String motto) {
		this.motto = motto;
	}

	public String getProfile() {
		return this.profile;
	}

	public void setProfile(String profile) {
		this.profile = HtmlConverter.parseHtml(profile);
	}
}
