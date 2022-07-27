package com.salguMarket.member.model;

import java.sql.SQLException;
import java.util.List;

public class MemberService {
	//아이디 중복확인 & 찾기
	public static final int USABLE_ID=1; //사용가능(신규)
	public static final int UNUSABLE_ID=2;//사용불가(이미 존재)
	//닉네임 중복확인
	public static final int USABLE_NICKNAME=1;  
	public static final int UNUSABLE_NICKNAME=2; 
	//로그인 체크에서 사용하는 상수(checkLogin,)
	public static final int LOGIN_OK=1;//성공
	public static final int DISAGREE_PWD=2;//비번 불일치
	public static final int NONE_ID=3;//아이디 없음

	private MemberDAO memDao;

	public MemberService() {
		memDao=new MemberDAO();
	}
	//회원가입
	public int insertMember(MemberVO memVo) throws SQLException {
		return memDao.insertMember(memVo);
	}
	//전체회원조회
	public List<MemberVO> selectAll() throws SQLException {
		return memDao.selectAll();
		
	}
	//회원아이디로 조회
	public MemberVO selectById(String mId) throws SQLException {
		return memDao.selectById(mId);
	}
	//닉네임으로 조회
	public MemberVO selectByNick(String mNick) throws SQLException {
		return memDao.selectByNick(mNick);
	}
	//회원정보삭제
	public int deleteMember(String mId) throws SQLException {
		return memDao.deleteMember(mId);
	}
	//회원정보수정
	public int updateMember(MemberVO memVo) throws SQLException {
		return memDao.updateMember(memVo);
	}
	//아이디 중복검사, 등록회원확인
	public int duplicateId(String mId) throws SQLException {
		return memDao.duplicateId(mId);
	}
	//닉네임 중복검사, 등록회원확인
	public int duplicateNick(String mNick) throws SQLException {
		return memDao.duplicateNick(mNick);
	}
	//로그인 체크
	public int checkLogin(String mId, String mPwd) throws SQLException {
		return memDao.checkLogin(mId, mPwd);//1,2,3
	}


}
