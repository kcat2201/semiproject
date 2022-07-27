package com.salguMarket.member.model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.salguMarket.db.ConnectionPoolMgr2;

public class MemberDAO {
	private ConnectionPoolMgr2 pool;

	public MemberDAO(){
		pool=new ConnectionPoolMgr2();
	}
	//회원가입
	public int insertMember(MemberVO memVo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			con=pool.getConnection();

			String sql="insert into member(mNo, mId, mPwd, "
					+ "mName, mNick, mHp, mZip, mAdd1, mAdd2, "
					+ "mPwdHint, mPwdAns)"
					+ " values(member_seq.nextval,?,?,?,?,?,?,?,?,?,?)";
			ps=con.prepareStatement(sql);

			ps.setString(1, memVo.getmId());
			ps.setString(2, memVo.getmPwd());
			ps.setString(3, memVo.getmName());
			ps.setString(4, memVo.getmNick());
			ps.setString(5, memVo.getmHp());
			ps.setString(6, memVo.getmZip());
			ps.setString(7, memVo.getmAdd1());
			ps.setString(8, memVo.getmAdd2());
			ps.setString(9, memVo.getmPwdHint());
			ps.setString(10, memVo.getmPwdAns());

			int cnt=ps.executeUpdate();
			System.out.println("회원가입 결과 cnt="+cnt+", 매개변수 memVo="+memVo);
			return cnt;

		}finally {
			pool.dbClose(ps, con);
		}
	}

	//전체회원조회
	public List<MemberVO> selectAll() throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		List<MemberVO> list = new ArrayList<MemberVO>();
		try {			
			con=pool.getConnection();

			String sql="select * from member order by no desc";
			ps=con.prepareStatement(sql);

			rs=ps.executeQuery();

			while(rs.next()) {
				int mNo=rs.getInt("mNo");
				String mId=rs.getString("mId");
				String mPwd=rs.getString("mPwd");
				String mName=rs.getString("mName");
				String mNick=rs.getString("mNick");
				String mHp=rs.getString("mHp");
				String mZip=rs.getString("mZip");
				String mAdd1=rs.getString("mAdd1");
				String mAdd2=rs.getString("mAdd2");
				String mPwdHint=rs.getString("mPwdHint");
				String mPwdAns=rs.getString("mPwdAns");
				Timestamp regdate=rs.getTimestamp("regdate");

				MemberVO memVo = new MemberVO(mNo, mId, mPwd, mName,
						mNick, mHp, mZip, mAdd1, mAdd2, mPwdHint,
						mPwdAns, regdate);
				list.add(memVo);
			}
			System.out.println("전체 회원 조회결과 list.size="+ list.size());
			return list;

		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	//아이디로 조회
	public MemberVO selectById(String mId) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		MemberVO memVo=new MemberVO();
		try {
			con=pool.getConnection();

			String sql="select * from member where mId=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, mId);

			rs=ps.executeQuery();
			if(rs.next()) {
				memVo.setmNo(rs.getInt("mNo"));
				memVo.setmId(mId);
				memVo.setmPwd(rs.getString("mPwd"));
				memVo.setmName(rs.getString("mName"));
				memVo.setmNick(rs.getString("mNick"));
				memVo.setmHp(rs.getString("mHp"));
				memVo.setmZip(rs.getString("mZip"));
				memVo.setmAdd1(rs.getString("mAdd1"));
				memVo.setmAdd2(rs.getString("mAdd2"));
				memVo.setmPwdHint(rs.getString("mPwdHint"));
				memVo.setmPwdAns(rs.getString("mPwdAns"));
				memVo.setRegdate(rs.getTimestamp("regdate"));
			}
			System.out.println("매개변수 mId="+mId+"로 조회한 결과 memVo="+memVo);
			return memVo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	//닉네임으로 조회
	public MemberVO selectByNick(String mNick) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		MemberVO memVo=new MemberVO();
		try {
			con=pool.getConnection();

			String sql="select * from member where mNick=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, mNick);

			rs=ps.executeQuery();
			if(rs.next()) {
				memVo.setmNo(rs.getInt("mNo"));
				memVo.setmId(rs.getString("mId"));
				memVo.setmPwd(rs.getString("mPwd"));
				memVo.setmName(rs.getString("mName"));
				memVo.setmNick(mNick);
				memVo.setmHp(rs.getString("mHp"));
				memVo.setmZip(rs.getString("mZip"));
				memVo.setmAdd1(rs.getString("mAdd1"));
				memVo.setmAdd2(rs.getString("mAdd2"));
				memVo.setmPwdHint(rs.getString("mPwdHint"));
				memVo.setmPwdAns(rs.getString("mPwdAns"));
				memVo.setRegdate(rs.getTimestamp("regdate"));
			}
			System.out.println("매개변수 mNick="+mNick+"로 조회한 결과 memVo="+memVo);
			return memVo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	//회원정보 삭제(탈퇴시 update로 내용변경)
	public int deleteMember(String mId) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			con=pool.getConnection();

			String sql="delete from member where mId=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, mId);

			int cnt=ps.executeUpdate();
			System.out.println("회원정보 삭제결과 cnt="+cnt+", 매개변수 mId="+mId);

			return cnt;

		}finally {
			pool.dbClose(ps, con);
		}
	}

	/*
	 * 회원정보수정(mPwd, mName, mNick, mHp, mZip, mAdd1, mAdd2, "
	+ "mPwdHint, mPwdAns
	 */
	public int updateMember(MemberVO memVo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		try {
			con=pool.getConnection();

			String sql="update member"
					+ " set mPwd=?, mName=?, mNick=?, mHp=?,"
					+ " mZip=?, mAdd1=?, mAdd2=?, mPwdHint=?, mPwdAns=?"
					+ " where mId=?";
			ps=con.prepareStatement(sql);

			ps.setString(1, memVo.getmPwd());
			ps.setString(2, memVo.getmName());
			ps.setString(3, memVo.getmNick());
			ps.setString(4, memVo.getmHp());
			ps.setString(5, memVo.getmZip());
			ps.setString(6, memVo.getmAdd1());
			ps.setString(7, memVo.getmAdd2());
			ps.setString(8, memVo.getmPwdHint());
			ps.setString(9, memVo.getmPwdAns());
			ps.setString(10, memVo.getmId());

			int cnt=ps.executeUpdate();
			System.out.println("회원정보 수정 결과 cnt="+cnt
					+", 매개변수 memVo="+memVo);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}


	//mId 중복확인
	public int duplicateId(String mId) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		int result=0;
		try {
			con=pool.getConnection();

			String sql="select count(*) from member where mId=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, mId);

			rs=ps.executeQuery();
			if(rs.next()) {
				int count=rs.getInt(1);
				if(count > 0) {
					result=MemberService.UNUSABLE_ID;//이미 사용중(2)
				}else {
					result=MemberService.USABLE_ID;//사용가능(1)				
				}
			}

			System.out.println("아이디 중복확인결과 result="+result
					+", 매개변수 mId="+mId);
			return result;

		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	//mNick 중복확인
	public int duplicateNick(String mNick) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		int result=0;
		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql="select count(*) from member where mNick=?";
			ps=con.prepareStatement(sql);

			ps.setString(1, mNick);

			//4
			rs=ps.executeQuery();
			if(rs.next()) {
				int count=rs.getInt(1);
				if(count > 0) {
					result=MemberService.UNUSABLE_NICKNAME;//이미 사용중(2) 
				}else {
					result=MemberService.USABLE_NICKNAME;//사용가능(1)					
				}
			}

			System.out.println("닉네임 중복확인결과 result="+result
					+", 매개변수 mNick="+mNick);
			return result;

		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	public int checkLogin(String mId, String mPwd) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		int result=0;
		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql="select mPwd from member "
					+ " where mId=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, mId);

			//4
			rs=ps.executeQuery();
			if(rs.next()) {
				String dbmPwd = rs.getString(1);
				if(dbmPwd.equals(mPwd)) {
					result = MemberService.LOGIN_OK;
				}else {
					result = MemberService.DISAGREE_PWD;
				}
			}else {
				result = MemberService.NONE_ID;
			}
			System.out.println("로그인 체크 결과 result="+result
					+", 매개변수 mId="+mId+", pwd="+mPwd);
			return result;

		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

}



