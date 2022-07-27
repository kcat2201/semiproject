package com.salguMarket.zipcode.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.salguMarket.db.ConnectionPoolMgr2;

public class ZipcodeDAO {
	private ConnectionPoolMgr2 pool;

	public ZipcodeDAO() {
		pool=new ConnectionPoolMgr2();
	}
	
	//우편번호 검색결과
	public List<ZipcodeVO> selectAll(String sDong) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<ZipcodeVO> list = new ArrayList<ZipcodeVO>();

		try {
			con=pool.getConnection();

			String sql="select * from zipcode where dong like '%'||?||'%'";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, sDong);

			rs=ps.executeQuery();
			while(rs.next()) {
				String zipcode=rs.getString(1);
				String sido=rs.getString(2);
				String gugun=rs.getString(3);
				String dong=rs.getString(4);
				String startBunji=rs.getString(5);
				String endBunji=rs.getString(6);
				int seq=rs.getInt(7);

				ZipcodeVO zipVo= new ZipcodeVO(zipcode, sido,
						gugun, dong, startBunji, endBunji, seq);
				list.add(zipVo);
			}
			
			System.out.println("우편번호 검색결과 list.size="+list.size()
				+", 매개변수 sDong ="+sDong);
			return list;
			
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

}
