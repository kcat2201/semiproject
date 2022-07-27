package com.salguMarket.sales.model;

import java.sql.Timestamp;

public class SalesVO {
	private int sNo;
	private int dNo;
	private Timestamp salesdate;
	
	public SalesVO() {
		super();
	}

	public SalesVO(int sNo, int dNo, Timestamp salesdate) {
		super();
		this.sNo = sNo;
		this.dNo = dNo;
		this.salesdate = salesdate;
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public int getdNo() {
		return dNo;
	}

	public void setdNo(int dNo) {
		this.dNo = dNo;
	}

	public Timestamp getSalesdate() {
		return salesdate;
	}

	public void setSalesdate(Timestamp salesdate) {
		this.salesdate = salesdate;
	}

	@Override
	public String toString() {
		return "SalesVO [sNo=" + sNo + ", dNo=" + dNo + ", salesdate=" + salesdate + "]";
	}
	
}
