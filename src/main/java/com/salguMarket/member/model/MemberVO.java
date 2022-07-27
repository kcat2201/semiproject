package com.salguMarket.member.model;

import java.sql.Timestamp;

public class MemberVO {
	private int mNo; //회원번호
    private String mId;//회원아이디(이메일)
    private String mPwd;//회원비밀번호
    private String mName;//회원이름
    private String mNick;//닉네임
    private String mHp;//전화번호
    private String mZip;//우편번호
    private String mAdd1;//주소
    private String mAdd2;//상세주소
    private String mPwdHint;//비밀번호찾기 질문
    private String mPwdAns;//비밀번호찾기 답변
    private Timestamp regdate;//가입일
    //private Timestamp outdate;//탈퇴일
    
    
	public MemberVO() {
		super();
	}

	public MemberVO(int mNo, String mId, String mPwd, String mName, String mNick, String mHp, String mZip, String mAdd1,
			String mAdd2, String mPwdHint, String mPwdAns, Timestamp regdate) {
		super();
		this.mNo = mNo;
		this.mId = mId;
		this.mPwd = mPwd;
		this.mName = mName;
		this.mNick = mNick;
		this.mHp = mHp;
		this.mZip = mZip;
		this.mAdd1 = mAdd1;
		this.mAdd2 = mAdd2;
		this.mPwdHint = mPwdHint;
		this.mPwdAns = mPwdAns;
		this.regdate = regdate;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmPwd() {
		return mPwd;
	}

	public void setmPwd(String mPwd) {
		this.mPwd = mPwd;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmNick() {
		return mNick;
	}

	public void setmNick(String mNick) {
		this.mNick = mNick;
	}

	public String getmHp() {
		return mHp;
	}

	public void setmHp(String mHp) {
		this.mHp = mHp;
	}

	public String getmZip() {
		return mZip;
	}

	public void setmZip(String mZip) {
		this.mZip = mZip;
	}

	public String getmAdd1() {
		return mAdd1;
	}

	public void setmAdd1(String mAdd1) {
		this.mAdd1 = mAdd1;
	}

	public String getmAdd2() {
		return mAdd2;
	}

	public void setmAdd2(String mAdd2) {
		this.mAdd2 = mAdd2;
	}

	public String getmPwdHint() {
		return mPwdHint;
	}

	public void setmPwdHint(String mPwdHint) {
		this.mPwdHint = mPwdHint;
	}

	public String getmPwdAns() {
		return mPwdAns;
	}

	public void setmPwdAns(String mPwdAns) {
		this.mPwdAns = mPwdAns;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "MemberVO [mNo=" + mNo + ", mId=" + mId + ", mPwd=" + mPwd + ", mName=" + mName + ", mNick=" + mNick
				+ ", mHp=" + mHp + ", mZip=" + mZip + ", mAdd1=" + mAdd1 + ", mAdd2=" + mAdd2 + ", mPwdHint=" + mPwdHint
				+ ", mPwdAns=" + mPwdAns + ", regdate=" + regdate + "]";
	}
	
}

