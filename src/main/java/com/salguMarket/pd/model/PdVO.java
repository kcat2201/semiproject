package com.salguMarket.pd.model;

import java.sql.Timestamp;

public class PdVO {

	private int pNo;
	private String cCode;
	private int sellerNo;
	private String pTitle;
	private int price;
	private String detail;
	private Timestamp regdate;
	private String saleflag;
	private int buyerNo;
	
	// 파일
	private String fileName;
	private long fileSize;
	private String originalFilename;
	private int readcount;

	public PdVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PdVO(int pNo, String cCode, int sellerNo, String pTitle, int price, String detail, Timestamp regdate,
			String saleflag, int buyerNo, String fileName, long fileSize, String originalFilename, int readcount) {
		super();
		this.pNo = pNo;
		this.cCode = cCode;
		this.sellerNo = sellerNo;
		this.pTitle = pTitle;
		this.price = price;
		this.detail = detail;
		this.regdate = regdate;
		this.saleflag = saleflag;
		this.buyerNo = buyerNo;
		this.fileName = fileName;
		this.fileSize = fileSize;
		this.originalFilename = originalFilename;
		this.readcount = readcount;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public String getcCode() {
		return cCode;
	}

	public void setcCode(String cCode) {
		this.cCode = cCode;
	}

	public int getSellerNo() {
		return sellerNo;
	}

	public void setSellerNo(int sellerNo) {
		this.sellerNo = sellerNo;
	}

	public String getpTitle() {
		return pTitle;
	}

	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getSaleflag() {
		return saleflag;
	}

	public void setSaleflag(String saleflag) {
		this.saleflag = saleflag;
	}

	public int getBuyerNo() {
		return buyerNo;
	}

	public void setBuyerNo(int buyerNo) {
		this.buyerNo = buyerNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public String getOriginalFilename() {
		return originalFilename;
	}

	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	@Override
	public String toString() {
		return "PdVO [pNo=" + pNo + ", cCode=" + cCode + ", sellerNo=" + sellerNo + ", pTitle=" + pTitle + ", price="
				+ price + ", detail=" + detail + ", regdate=" + regdate + ", saleflag=" + saleflag + ", buyerNo="
				+ buyerNo + ", fileName=" + fileName + ", fileSize=" + fileSize + ", originalFilename="
				+ originalFilename + ", readcount=" + readcount + "]";
	}

	
}
