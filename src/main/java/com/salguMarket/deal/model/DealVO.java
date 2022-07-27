package com.salguMarket.deal.model;

import java.sql.Timestamp;

public class DealVO {
	private int dNo;			// 거래 번호
	private int bNo;			// 게시글 번호
	private int buyerNo;		// 구매자 번호
	private Timestamp dealdate;	// 구매일
	
	public DealVO() {
		super();
	}

	public DealVO(int dNo, int bNo, int buyerNo, Timestamp dealdate) {
		super();
		this.dNo = dNo;
		this.bNo = bNo;
		this.buyerNo = buyerNo;
		this.dealdate = dealdate;
	}

	public int getdNo() {
		return dNo;
	}

	public void setdNo(int dNo) {
		this.dNo = dNo;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public int getBuyerNo() {
		return buyerNo;
	}

	public void setBuyerNo(int buyerNo) {
		this.buyerNo = buyerNo;
	}

	public Timestamp getDealdate() {
		return dealdate;
	}

	public void setDealdate(Timestamp dealdate) {
		this.dealdate = dealdate;
	}

	@Override
	public String toString() {
		return "DealVO [dNo=" + dNo + ", bNo=" + bNo + ", buyerNo=" + buyerNo + ", dealdate=" + dealdate + "]";
	}

}
