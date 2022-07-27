package com.salguMarket.qboard.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.salguMarket.db.ConnectionPoolMgr2;

public class QboardDAO {
	private ConnectionPoolMgr2 pool;
	
	public QboardDAO() {
		pool=new ConnectionPoolMgr2();
	}
	
	public int insertQboard(QboardVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="insert into qna(qno, mno, qtitle, content, groupno)"
					+ " values(qna_seq.nextval, ?, ?, ?, qna_seq.nextval)";
			ps=con.prepareStatement(sql);
			ps.setInt(1, vo.getmNo());
			ps.setString(2, vo.getqTitle());
			ps.setString(3, vo.getContent());
			
			int cnt=ps.executeUpdate();
			System.out.println("글 등록 결과 cnt= "+cnt+", 매개변수 vo= "+vo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	//
	public List<QboardVO> selectAll(String condition, String keyword) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<QboardVO> list= new ArrayList<QboardVO>();
		try {
			con=pool.getConnection();
			
			/*
			  String
			  sql="select qna.qno , qna.qtitle, member.mid, qna.regdate,qna.readcount\r\n"
			  + " from qna, member\r\n" + " on qna.mno=member.mno";
			 */
			
				String sql = "select \r\n"
						+ "				    a.qno\r\n"
						+ "				    ,a.mno\r\n"
						+ "				    ,a.qtitle\r\n"
						+ "				    ,a.regdate\r\n"
						+ "				    ,a.content\r\n"
						+ "				    ,a.groupno\r\n"
						+ "				    ,a.step\r\n"
						+ "				    ,a.sortno\r\n"
						+ "				    ,a.readcount\r\n"
						+ "				    ,m.mid\r\n"
						+ "				from \r\n"
						+ "				    qna a\r\n"
						+ "				    ,member m\r\n"
						+ "				where \r\n"
						+ "				    a.mno = m.mno\r\n";
				if(keyword!=null && !keyword.isEmpty()) {
					sql += "and"+condition+" like '%'|| ? ||'%'"; 
				}
			
//			    String sql="select * from qna";
//			 			if(keyword!=null && !keyword.isEmpty()) {
//				sql+=" where "+condition+" like '%'|| ? ||'%'"; 
//			}
			
			sql+=" order by qno desc, sortno";
			
			ps=con.prepareStatement(sql);
			
			if(keyword!=null && !keyword.isEmpty()) { 
				ps.setString(1, keyword); 
			}
			
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int qNo=rs.getInt("qNo");
				int mNo=rs.getInt("mNo");
				/* String mId=rs.getString("mid"); */
				String qTtile= rs.getString("qTitle");
				String content= rs.getString("content");
				int readcount=rs.getInt("readcount");
				Timestamp regdate= rs.getTimestamp("regdate");
				
				int groupNo=rs.getInt("groupNo");
				int step=rs.getInt("step");
				int sortNo=rs.getInt("sortNo");
				String mId = rs.getString("mid");
				
				
				QboardVO vo= new QboardVO(qNo, mNo, qTtile, regdate, content,readcount, mId, groupNo, step, sortNo);
				list.add(vo);
			}
			
			System.out.println("전체조회 list.size="+list.size()+", 매개변수 condition="+condition+", keyword="+ keyword);
			//
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public QboardVO selectByNo(int qNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		QboardVO vo= new QboardVO();
		try {
			con=pool.getConnection();
			
			/*
			 * String sql=" select qNo, qtitle, content b.mid\r\n" +
			 * "    from qna a join member b\r\n" + "    on a.mno = b.mno\r\n" +
			 * "    where b.mid=?";
			 */
			String sql="select * from qna where qno=?";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, qNo);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				vo.setmNo(qNo);
				vo.setmNo(rs.getInt("mNo"));
				vo.setqTitle(rs.getString("qTitle"));
				vo.setContent(rs.getString("content"));
				vo.setReadcount(rs.getInt("readcount"));
				vo.setGroupNo(rs.getInt("groupno"));
				vo.setStep(rs.getInt("step"));
				vo.setSortNo(rs.getInt("sortno"));
			}
			System.out.println("글상세보기 결과 vo="+vo+", 매개변수 =mno"+qNo);
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	//수정메소드
	public int updateQboard(QboardVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="update qna"
					+ " set qtitle=?, content=?"
					+ " where qno=?";
			
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getqTitle());
			ps.setString(2, vo.getContent());
			ps.setInt(3, vo.getqNo());
			
			int cnt=ps.executeUpdate();
			return cnt;
			
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int deleteqBoard(int qNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="delete from qna where qno=?";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, qNo);
			
			int cnt=ps.executeUpdate();
			System.out.println("삭제 결과 cnt="+cnt+", 매개변수 no="+qNo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int updateCount(int qNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			con=pool.getConnection();

			String sql="update qna set readcount=readcount+1"
		               + " where qNo=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, qNo);

			int cnt=ps.executeUpdate();
			System.out.println("조회수 증가 결과 cnt="+cnt+", 매개변수 no="+qNo);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	public int reply(QboardVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int cnt=0;
		try {
			//1,2
			con=pool.getConnection();

			//트랜잭션 시작
			 con.setAutoCommit(false); 
			
			String sql="update qna"
					+ " set sortno=sortno+1"
					+ " where groupno=? and sortno>?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, vo.getGroupNo());
			ps.setInt(2, vo.getSortNo());
			
			cnt=ps.executeUpdate();
			System.out.println("sortNo update 결과 cnt="+cnt);
			
			//3
			String sql2="insert into qna(qno, mno, qtitle, content, "
					+ " groupNo, step, sortno)"
					+ " values(qna_seq.nextval, ?, ?,?,?,?,?)";
			ps=con.prepareStatement(sql2);
			
			ps.setInt(1, vo.getmNo());
			ps.setString(2, vo.getqTitle());
			ps.setString(3, vo.getContent());
			ps.setInt(4, vo.getGroupNo());
			ps.setInt(5, vo.getStep()+1);
			ps.setInt(6, vo.getSortNo()+1);
			
			//4
			cnt=ps.executeUpdate();
			System.out.println("답변등록 결과 cnt="+cnt+", 매개변수 vo="+vo);
			System.out.println();
			
			//커밋
			con.commit();
		}catch (SQLException e) {
			//롤백
			con.rollback();
			e.printStackTrace();
		}finally {
			
			pool.dbClose(ps, con);
		}
	
		return cnt;
	}
	
}
