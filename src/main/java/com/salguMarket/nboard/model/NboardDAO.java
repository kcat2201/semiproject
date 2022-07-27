package com.salguMarket.nboard.model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.salguMarket.db.ConnectionPoolMgr2;

public class NboardDAO {
private ConnectionPoolMgr2 pool;
	
	public NboardDAO() {
		pool=new ConnectionPoolMgr2();
	}
	
	public int insertNboard(NboardVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			int sum=3;
			String sql="insert into notice(nno, aid, ntitle, content, filename, filesize, originalfilename)"
					+ " values(notice_seq.nextval,'admin@salgu.com',?,?,?,?,?)";
			ps=con.prepareStatement(sql);
			/* ps.setString(1, vo.getaId()); */
			ps.setString(1, vo.getnTitle());
			ps.setString(2, vo.getContent());
			ps.setString(3, vo.getFileName());
			ps.setLong(4, vo.getFileSize());
			ps.setString(5, vo.getOriginalFileName());
			
			int cnt=ps.executeUpdate();
			System.out.println("글 등록 결과 =cnt"+cnt+", 매개변수 vo="+vo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public List<NboardVO> selectAll(String condition, String keyword) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<NboardVO> list= new ArrayList<NboardVO>();
		
		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql="select * from notice";
			if(keyword!=null && !keyword.isEmpty()) {
				sql+=" where "+condition+" like '%' || ? || '%'";
			}
			sql+=" order by nno desc";
			ps=con.prepareStatement(sql);
				
			if(keyword!=null && !keyword.isEmpty()) {
				ps.setString(1, keyword);
			}
			
			rs=ps.executeQuery();
			
			while(rs.next()) {
				int nNo=rs.getInt("nNo");
				String aId=rs.getString("aId");
				String nTitle=rs.getString("nTitle");
				Timestamp regdate=rs.getTimestamp("regdate");
				int readcount=rs.getInt("readcount");
				String content=rs.getString("content");
				String filename=rs.getString("filename");
				int filesize=rs.getInt("filesize");
				int downcount=rs.getInt("downcount");
				String originalfilename=rs.getString("originalfilename");

				NboardVO vo= new NboardVO(nNo, aId, nTitle, regdate, readcount, content, filename, filesize, downcount, originalfilename);
				list.add(vo);
			}
			System.out.println("전체조회 list.size="+list.size()+", 매개변수 condition="+condition+", keyword="+ keyword);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public NboardVO selectByNo(int nNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		NboardVO vo= new NboardVO();
		try {
			con=pool.getConnection();
			
			String sql="select * from notice where nno=?";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, nNo);
			rs=ps.executeQuery();
			if(rs.next()) {
				vo.setnNo(nNo);
				vo.setaId(rs.getString("aid"));
				vo.setnTitle(rs.getString("nTitle"));
				vo.setReadcount(rs.getInt("readcount"));
				vo.setContent(rs.getString("content"));
				vo.setFileName(rs.getString("filename"));
				vo.setFileSize(rs.getInt("filesize"));
				vo.setDownCount(rs.getInt("downcount"));
				vo.setOriginalFileName(rs.getString("originalFilename"));
				
			}
			System.out.println("글 상세보기 결과 vo= "+vo+", 매개변수 nno"+nNo);
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int updateNboard(NboardVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="update notice"
					+ " set ntitle=?, content=?";
					
			if(vo.getFileName()!=null && !vo.getFileName().isEmpty()) {
				sql+=", filename=?, filesize=?, originalfilename=?";
			}
			sql+=" where nNo=?";
			ps=con.prepareStatement(sql);
			
			/* ps.setString(1, vo.getaId()); */
			ps.setString(1, vo.getnTitle());
			ps.setString(2, vo.getContent());
			
			if(vo.getFileName()!=null && !vo.getFileName().isEmpty()) {
				ps.setString(3, vo.getFileName());
				ps.setLong(4, vo.getFileSize());
				ps.setString(5, vo.getOriginalFileName());
				ps.setInt(6, vo.getnNo());
			}else {
				ps.setInt(3, vo.getnNo());
			}
			System.out.println("???????????????????"+vo.getContent());
			
			int cnt=ps.executeUpdate();
			System.out.println("글 수정결과 cnt="+cnt+", 매개변수vo="+vo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int deleteNboard(int nNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		try {
			con= pool.getConnection();
			
			String sql="delete from notice where nno=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, nNo);
			
			int cnt=ps.executeUpdate();
			System.out.println("글삭제 결과 cnt="+cnt+", 매개변수 nNo="+nNo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int updateCount(int nNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			con=pool.getConnection();

			String sql="update notice set readcount=readcount+1"
		               + " where nno=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, nNo);

			int cnt=ps.executeUpdate();
			System.out.println("조회수 증가 결과 cnt="+cnt+", 매개변수 no="+nNo);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int updateDownCount(int nNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			con=pool.getConnection();

			String sql="update notice set downcount=downcount+1"
		               + " where nno=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, nNo);

			int cnt=ps.executeUpdate();
			System.out.println("다운로드수 증가 결과 cnt="+cnt+", 매개변수 nNo="+nNo);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
}
