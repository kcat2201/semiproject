package com.salguMarket.sales.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.salguMarket.db.ConnectionPoolMgr2;

public class SalesDAO {
	private ConnectionPoolMgr2 pool;

	public SalesDAO() {
		pool = new ConnectionPoolMgr2();
	}
	
	public int insertSales(int dNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = pool.getConnection();
			
			String sql = "insert into sales(sNo, dNo, salesdate) "
					+ "values(sales_seq.nextval, ?, sysdate)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, dNo);
			
			int cnt = ps.executeUpdate();
			
			System.out.println("판매완료 입력 결과 cnt = " + cnt
					+ ", 매개변수dNoo = " + dNo);
			
			return cnt;
			
		} finally {
			pool.dbClose(ps, con);
		}
	}
	
	public List<SalesVO> selectSalesByDNo(int dNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<SalesVO> list = new ArrayList<SalesVO>();
		
		try {
			con = pool.getConnection();
			
			String sql = "select * from sales where dNo = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, dNo);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				SalesVO vo = new SalesVO(rs.getInt("sNo"), rs.getInt("dNo"), rs.getTimestamp("salesdate"));
				
				list.add(vo);
			}
			
			System.out.println("판매완료 조회 결과 listSize = " + list.size()
					+ ", 매개변수dNo = " + dNo);
			
			return list;
			
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
}
