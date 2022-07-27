package com.salguMarket.nboard.model;

import java.sql.Timestamp;

public class NboardVO {

	private int nNo;
	private String aId;
	private String nTitle;
	private Timestamp regdate;
	private int readcount;
	private String content;
	private String fileName;
	private long fileSize;
	private int downCount;
	private String originalFileName;
	
	public NboardVO() {
		super();
	}

	public NboardVO(int nNo, String aId, String nTitle, Timestamp regdate, int readcount, String content,
			String fileName, long fileSize, int downCount, String originalFileName) {
		super();
		this.nNo = nNo;
		this.aId = aId;
		this.nTitle = nTitle;
		this.regdate = regdate;
		this.readcount = readcount;
		this.content = content;
		this.fileName = fileName;
		this.fileSize = fileSize;
		this.downCount = downCount;
		this.originalFileName = originalFileName;
	}

	public int getnNo() {
		return nNo;
	}

	public void setnNo(int nNo) {
		this.nNo = nNo;
	}

	public String getaId() {
		return aId;
	}

	public void setaId(String aId) {
		this.aId = aId;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public int getDownCount() {
		return downCount;
	}

	public void setDownCount(int downCount) {
		this.downCount = downCount;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	@Override
	public String toString() {
		return "NboardVO [nNo=" + nNo + ", aId=" + aId + ", nTitle=" + nTitle + ", regdate=" + regdate + ", readcount="
				+ readcount + ", content=" + content + ", fileName=" + fileName + ", fileSize=" + fileSize
				+ ", downCount=" + downCount + ", originalFileName=" + originalFileName + "]";
	}
	
	
	
	
	
}
