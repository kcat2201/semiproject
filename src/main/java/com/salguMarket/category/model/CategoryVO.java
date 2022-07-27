package com.salguMarket.category.model;

public class CategoryVO {
/*
    cName VARCHAR2(20) NOT NULL,
	cCode VARCHAR2(30) NOT NULL,
    cNoRef VARCHAR2(30) NULL,
*/
	private String cName;
	private String cCode;
	private String cNoRef;
	
	public CategoryVO() {
		super();
	}

	public CategoryVO(String cName, String cCode, String cNoRef) {
		super();
		this.cName = cName;
		this.cCode = cCode;
		this.cNoRef = cNoRef;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getcCode() {
		return cCode;
	}

	public void setcCode(String cCode) {
		this.cCode = cCode;
	}

	public String getcNoRef() {
		return cNoRef;
	}

	public void setcNoRef(String cNoRef) {
		this.cNoRef = cNoRef;
	}

	@Override
	public String toString() {
		return "CategoryVO [cName=" + cName + ", cCode=" + cCode + ", cNoRef=" + cNoRef + "]";
	}
	
}
