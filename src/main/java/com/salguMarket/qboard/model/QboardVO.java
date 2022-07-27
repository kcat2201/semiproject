package com.salguMarket.qboard.model;

import java.sql.Timestamp;

public class QboardVO {
	
	private int qNo;
	private int mNo;
	private String qTitle;
	private Timestamp regdate;
	private String content;
	private int readcount;
	private String mId;
	
	private int groupNo;
	private int step;
	private int sortNo;

	public QboardVO() {
		super();
	}

	public QboardVO(int qNo, int mNo, String qTitle, Timestamp regdate, String content, int readcount, String mId,
			int groupNo, int step, int sortNo) {
		super();
		this.qNo = qNo;
		this.mNo = mNo;
		this.qTitle = qTitle;
		this.regdate = regdate;
		this.content = content;
		this.readcount = readcount;
		this.mId = mId;
		this.groupNo = groupNo;
		this.step = step;
		this.sortNo = sortNo;
	}
	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getqTitle() {
		return qTitle;
	}

	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getSortNo() {
		return sortNo;
	}

	public void setSortNo(int sortNo) {
		this.sortNo = sortNo;
	}

	@Override
	public String toString() {
		return "QboardVO [qNo=" + qNo + ", mNo=" + mNo + ", qTitle=" + qTitle + ", regdate=" + regdate + ", content="
				+ content + ", readcount=" + readcount +", groupNo=" + groupNo + ", step=" + step +", sortNo=" + sortNo+ ",mId="+mId+"]";
	}
	
}
