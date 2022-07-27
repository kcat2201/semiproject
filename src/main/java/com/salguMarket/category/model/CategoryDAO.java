package com.salguMarket.category.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.salguMarket.db.ConnectionPoolMgr2;
import com.salguMarket.pd.model.PdVO;

public class CategoryDAO {
	private ConnectionPoolMgr2 pool;
	public PdVO vo;
	
	public CategoryDAO() {
		pool = new ConnectionPoolMgr2();
		vo = new PdVO();
	}

	public List<PdVO> selectByCategory(String cCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		PdVO vo = new PdVO();
		List<PdVO> list = new ArrayList<PdVO>();
		try {
			// 1,2
			con = pool.getConnection();

			//
			String sql = "select * from pd where cCode=? and saleflag='N'";
			ps = con.prepareStatement(sql);

			ps.setString(1, cCode);
			
			
			// 4
			rs = ps.executeQuery();
			while (rs.next()) {

				int pNo = rs.getInt("pNo");
				int sellerNo = rs.getInt("sellerNo");
				String pTitle = rs.getString("pTitle");
				int price = rs.getInt("price");
				String detail = rs.getString("detail");
				int readcount = rs.getInt("readcount");
				Timestamp regdate = rs.getTimestamp("regdate");
				String saleflag = rs.getString("saleflag");
				int buyerNo = rs.getInt("buyerNo");
				
				// �뙆�씪
				String fileName = rs.getString("fileName");
				String originalFilename = rs.getString("originalFilename");
				long fileSize = rs.getLong("fileSize");

				vo = new PdVO(pNo, cCode, sellerNo, pTitle, price, detail, regdate, saleflag, buyerNo, fileName, fileSize,
						originalFilename, readcount);
				
				list.add(vo);
			}
			
			System.out.println("category 조회 결과 list.size=" + list.size() + ", 매개변수 cCode=" + cCode);

			return list;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}

	public List<PdVO> selectAll(String keyword) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		List<PdVO> list = new ArrayList<PdVO>();
		try {
			// 1,2
			con = pool.getConnection();

			// 3
			String sql = "select * from pd where saleflag='N'";
			if(keyword!=null && !keyword.isEmpty()) {
				sql+=" and pTitle like '%' || ? || '%'";
			}
			sql+=" order by pNo desc";
			ps = con.prepareStatement(sql);
			
			if(keyword!=null && !keyword.isEmpty()) {
				ps.setString(1, keyword);
			}
			
			//4
			rs = ps.executeQuery();
			while (rs.next()) {
				int pNo = rs.getInt("pNo");
				String cCode = rs.getString("cCode");
				int sellerNo = rs.getInt("sellerNo");
				String pTitle = rs.getString("pTitle");
				int price = rs.getInt("price");
				String detail = rs.getString("detail");
				int readcount = rs.getInt("readcount");
				Timestamp regdate = rs.getTimestamp("regdate");
				String saleflag = rs.getString("saleflag");
				int buyerNo = rs.getInt("buyerNo");
				
				// �뙆�씪
				String fileName = rs.getString("fileName");
				String originalFilename = rs.getString("originalFilename");
				long fileSize = rs.getLong("fileSize");

				PdVO vo = new PdVO(pNo, cCode, sellerNo, pTitle, price, detail, regdate, saleflag, buyerNo, fileName, fileSize,
						originalFilename, readcount);
				list.add(vo);
			}
			
			System.out.println("전체 조회 결과 list.size=" + list.size()
				+", 매개변수 keyword=" + keyword);
			
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public String selectCateBycCode(String cCode2) throws SQLException { // 카테고리코드로 카테고리명 조회
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String codeName = "";

		try {
			// 1,2
			con = pool.getConnection();

			//
			String sql = "select * from category where cCode = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, cCode2);

			// 4
			rs = ps.executeQuery();
			if(rs.next()) {
				codeName = rs.getString("cName");
			}

			System.out.println("category 조회 결과 : " + codeName + ", 매개변수 cCode=" + cCode2);

			return codeName;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	
}
