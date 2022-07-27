package com.salguMarket.reply.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.salguMarket.db.ConnectionPoolMgr2;

public class ReplyDAO {

	private ConnectionPoolMgr2 pool;

	public ReplyDAO() {
		pool=new ConnectionPoolMgr2();
	}

	public int insertReply(ReplyVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			con=pool.getConnection();
			String sql="insert into reply(rno, mno, mNick, pNo, rcontent) values(reply_seq.nextval, ?, ?, ?, ?)";
			
			ps=con.prepareStatement(sql);

			
			ps.setInt(1, vo.getmNo());
			ps.setString(2, vo.getmNick());
			ps.setInt(3, vo.getpNo());
			ps.setString(4, vo.getrContent());
		
			int cnt=ps.executeUpdate();
			System.out.println("댓글 등록 결과 cnt="+cnt+", 매개변수 vo="+vo);

			return cnt;
		} finally {
			pool.dbClose(ps, con);
		}
	}


	public int deleteReply(int rno) throws SQLException { 

		Connection con=null;
		PreparedStatement ps=null;

		try {

			//1,2
			con=pool.getConnection();

			//3
			String sql="delete from reply where rno=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, rno);

			int cnt=ps.executeUpdate();
			System.out.println("댓글 삭제 결과 cnt="+cnt+". 매개변수 rno="+rno);
			return cnt;

		} finally {
			pool.dbClose(ps, con);
		} 
	}

	public int updateReply(String rContent, int rNo) throws SQLException { 

		Connection con=null;
		PreparedStatement ps=null;

		try {

			//1,2
			con=pool.getConnection();

			//3
			
			String sql="update reply set rContent=? where rNo=?";
			//update reply set rContent='수정' where rNo=4;
			
			ps=con.prepareStatement(sql);

			ps.setString(1, rContent);
			ps.setInt(2, rNo);
			
			int cnt=ps.executeUpdate();
			
			System.out.println("댓글 수정 결과 cnt="+cnt+" 매개변수 rContent="+rContent+", rNo="+rNo);
			return cnt;

		} finally {
			pool.dbClose(ps, con);
		} 
	}

	public List<ReplyVO> selectAllBymNo(int no) throws SQLException { //회원이 작성한 전체 댓글 조회


		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		List<ReplyVO> list = new ArrayList<ReplyVO>();
		try {
			// 1,2
			con = pool.getConnection();

			// 3
			String sql = "select * from reply where mNo=?";
		
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			
			// 4
			rs = ps.executeQuery();
			while (rs.next()) {

				int rNo=rs.getInt("rNo");
				int mNo=rs.getInt("mNo");
				int pNo=rs.getInt("pNo");
				String mNick=rs.getString("mNick");
				String rContent=rs.getString("rContent");
				Timestamp regdate=rs.getTimestamp("regdate");


				ReplyVO vo=new ReplyVO(rNo, mNo, mNick, pNo, rContent, regdate);
				list.add(vo);
			}

			System.out.println(
					"회원 댓글 전체 조회 결과 list.size=" + list.size() + ", 매개변수 no=" + no);

			return list;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}

	public List<ReplyVO> selectAllBypNo(int no) throws SQLException { //게시글 댓글 조회


		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		List<ReplyVO> list = new ArrayList<ReplyVO>();
		try {
			// 1,2
			con = pool.getConnection();

			// 3
			String sql = "select * from reply where pNo=? order by rno desc";
		
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			
			// 4
			rs = ps.executeQuery();
			while (rs.next()) {

				int rNo=rs.getInt("rNo");
				int mNo=rs.getInt("mNo");
				int pNo=rs.getInt("pNo");
				String mNick=rs.getString("mNick");
				String rContent=rs.getString("rContent");
				Timestamp regdate=rs.getTimestamp("regdate");


				ReplyVO vo=new ReplyVO(rNo, mNo, mNick, pNo, rContent, regdate);
				list.add(vo);
			}

			System.out.println(
					"게시글 댓글 전체 조회 결과 list.size=" + list.size() + ", 매개변수 no=" + no);

			return list;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int countReply(int pNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int cnt=0;
		try {

			//1,2
			con=pool.getConnection();

			//3
			String sql="select count(*) from reply where pno=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, pNo);

			rs=ps.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt(1);
			}
			System.out.println("댓글 개수 cnt="+cnt+", 매개변수 pNo="+pNo);
			return cnt;

		} finally {
			pool.dbClose(rs, ps, con);
		} 
	}
	

}
