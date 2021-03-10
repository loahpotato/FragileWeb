package cn.fragile.pojo;

import java.util.Date;

public class Product {
	
	private Integer id;
	private String proCode;
	private String proName;
	private String proDesc;
	private String proDeveloper;
	private String proPublisher;
	private Date proDate;
	private Integer proPrice;
	private Integer createdBy;
	private Date creationDate;
	private Integer modifyBy;
	private Date modifyDate;
	private String proFilename;
	private Integer proCate;
	private String proVideo;

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getProCode() {
		return proCode;
	}
	public void setProCode(String proCode) {
		this.proCode = proCode;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getProDesc() {
		return proDesc;
	}
	public void setProDesc(String proDesc) {
		this.proDesc = proDesc;
	}
	public String getProDeveloper() { return proDeveloper; }
	public void setProDeveloper(String proDeveloper) { this.proDeveloper = proDeveloper; }
	public String getProPublisher() { return proPublisher; }
	public void setProPublisher(String proPublisher) { this.proPublisher = proPublisher; }
	public Date getProDate() { return proDate; }
	public void setProDate(Date proDate) { this.proDate = proDate; }
	public Integer getProPrice() { return proPrice; }
	public void setProPrice(Integer proPrice) {	this.proPrice = proPrice; }
	public Integer getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}
	public Date getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}
	public Integer getModifyBy() {
		return modifyBy;
	}
	public void setModifyBy(Integer modifyBy) {
		this.modifyBy = modifyBy;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	public String getProFilename() { return proFilename; }
	public void setProFilename(String proFilename) { this.proFilename = proFilename; }
	public Integer getProCate() { return proCate; }
	public void setProCate(Integer proCate) { this.proCate = proCate; }
	public String getProVideo() { return proVideo; }
	public void setProVideo(String proVideo) { this.proVideo = proVideo; }
}
