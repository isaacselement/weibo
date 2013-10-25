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
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE, region="photo")
@org.hibernate.annotations.Entity(dynamicUpdate=true)
public class Photo implements java.io.Serializable {

	private static final long serialVersionUID = -5899703145234269569L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id=-1;

/*	@Column(length = 4, nullable = false)
	private String type;
	
*/
	@Column(length = 50)
	private String photoName;
	
	@Column(length = 50)
	private String photoAddress;

	@Column(length = 50)
	private String photoDescription;

	@Column(length = 16)
	private String photoTime;

	

	// Constructors

	

	/**
	 * default constructor
	 */
	public Photo() {
	}

	/**
	 * minimal constructor
	 */
	public Photo(String photoAddress, String photoDescription, String photoTime) {
/*		this.type = type;*/
		this.photoAddress = photoAddress;
		this.photoDescription = photoDescription;
		this.photoTime = photoTime;

	}

	/**
	 * full constructor
	 */
	/*public Photo(String username, String sex, String password,
			String grade, String realName, String address, String blogsite, 
			String email, String phone, String birthday,
			String profile, String headIcon) {
		this.type = type;
		this.username = username;
		this.sex = sex;
		this.password = password;
		this.grade = grade;
		this.realName = realName;
		this.address=address;
		this.blogsite=blogsite;
		this.email = email;
		this.phone = phone;
		this.birthday=birthday;
		this.profile = profile;
		
	}*/

	// Property accessors
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPhotoAddress() {
		return photoAddress;
	}
	public void setPhotoAddress(String photoAddress) {
		this.photoAddress = photoAddress;
	}
	public String getPhotoDescription() {
		return photoDescription;
	}
	public void setPhotoDescription(String photoDescription) {
		this.photoDescription = photoDescription;
	}
	public String getPhotoTime() {
		return photoTime;
	}
	public void setPhotoTime(String phtoTime) {
		this.photoTime = phtoTime;
	}

	

}
