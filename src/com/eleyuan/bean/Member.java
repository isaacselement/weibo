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
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE, region="member")
@org.hibernate.annotations.Entity(dynamicUpdate=true)
public class Member implements java.io.Serializable {

	private static final long serialVersionUID = -5899703145234269569L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

/*	@Column(length = 4, nullable = false)
	private String type;
*/
	@Column(length = 4)
	private String title;

	@Column(length = 20, nullable = false)
	private String username;

	@Column(length = 1)
	private String sex;

	@Column(length = 45, nullable = false)
	private String password;


	@Column(length = 100)
	private String address;
	
	@Column(length = 45)
	private String birthday;
	
	@Column(length = 100)
	private String blogsite;
	
	@Column(length = 20)
	private String qq;

	@Column(length = 20)
	private String realName;

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
	public Member() {
	}

	/**
	 * minimal constructor
	 */
	public Member(String username, String sex, String password,
			String qq, String realName,String address, String email, String profile) {
/*		this.type = type;*/
		this.username = username;
		this.sex = sex;
		this.password = password;
		this.qq = qq;
		this.realName = realName;
		this.address=address;
		this.email = email;
		this.profile = profile;
	}

	/**
	 * full constructor
	 */
	public Member(String username, String sex, String password,
			String qq, String realName, String address, String blogsite, 
			String email, String phone, String birthday,
			String profile, String headIcon) {
/*		this.type = type;*/
		this.username = username;
		this.sex = sex;
		this.password = password;
		this.qq = qq;
		this.realName = realName;
		this.address=address;
		this.blogsite=blogsite;
		this.email = email;
		this.phone = phone;
		this.birthday=birthday;
		this.profile = profile;
		
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

/*	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}*/

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

	

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getRealName() {
		return this.realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
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
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getBlogsite() {
		return blogsite;
	}

	public void setBlogsite(String blogsite) {
		this.blogsite = blogsite;
	}

}
