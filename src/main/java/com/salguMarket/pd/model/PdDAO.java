package com.salguMarket.pd.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.salguMarket.db.ConnectionPoolMgr2;

public class PdDAO {

	private ConnectionPoolMgr2 pool;

	public PdDAO() {
		pool = new ConnectionPoolMgr2();
	}

	public int insertPd(PdVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = pool.getConnection();
			String sql = "insert into pd(pNo, cCode, sellerNo, pTitle, price, detail, fileName,fileSize,originalFilename) "
					+ "values(pd_seq.nextval, ?,?,?,?,?,?,?,?)";
			/*
			 * insert into pd(pNo, cCode, sellerNo, pTitle, price, detail,
			 * fileName,fileSize,originalFilename) values(pd_seq.nextval,
			 * '100',4,'test',1000,'�뀒�뒪�듃�엯�땲�떎','',0,'');
			 */
			ps = con.prepareStatement(sql);

			ps.setString(1, vo.getcCode());
			ps.setInt(2, vo.getSellerNo());
			ps.setString(3, vo.getpTitle());
			ps.setInt(4, vo.getPrice());
			ps.setString(5, vo.getDetail());
			ps.setString(6, vo.getFileName());
			ps.setLong(7, vo.getFileSize());
			ps.setString(8, vo.getOriginalFilename());

			int cnt = ps.executeUpdate();
			System.out.println("寃뚯떆湲� �벑濡� 寃곌낵 cnt=" + cnt + ", 留ㅺ컻蹂��닔 vo=" + vo);

			return cnt;
		} finally {
			pool.dbClose(ps, con);
		}
	}

	public int deletePd(int no) throws SQLException {

		Connection con = null;
		PreparedStatement ps = null;

		try {

			// 1,2
			con = pool.getConnection();

			// 3
			String sql = "delete from pd where pno=?"; // delete from pd where pno=2;
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);

			int cnt = ps.executeUpdate();
			System.out.println("寃뚯떆湲� �궘�젣 寃곌낵 cnt=" + cnt + ". 留ㅺ컻蹂��닔 no=" + no);
			return cnt;

		} finally {
			pool.dbClose(ps, con);
		}
	}

	public int updatePd(PdVO vo) throws SQLException {

		Connection con = null;
		PreparedStatement ps = null;

		try {

			// 1,2
			con = pool.getConnection();

			// 3
			/*
			 * update pd set ccode='101',ptitle='�뀒�뒪�듃2',price=2000,detail='�뀒�뒪�듃2�엯�땲�떎',
			 * fileName='a1.txt', fileSize=10,originalFilename='a.txt' where pno=5;
			 */
			String sql = "update pd set cCode=?,pTitle=?,price=?,detail=?";

			if (vo.getFileName() != null && !vo.getFileName().isEmpty())
				sql += ", fileName=?, fileSize=?,originalFilename=?";

			sql += " where pno=?";

			ps = con.prepareStatement(sql);

			ps.setString(1, vo.getcCode());
			ps.setString(2, vo.getpTitle());
			ps.setInt(3, vo.getPrice());
			ps.setString(4, vo.getDetail());

			if (vo.getFileName() != null && !vo.getFileName().isEmpty()) {

				ps.setString(5, vo.getFileName());
				ps.setLong(6, vo.getFileSize());
				ps.setString(7, vo.getOriginalFilename());
				ps.setInt(8, vo.getpNo());
			} else
				ps.setInt(5, vo.getpNo());

			int cnt = ps.executeUpdate();
			System.out.println("寃뚯떆湲� �닔�젙 寃곌낵 cnt=" + cnt + " 留ㅺ컻蹂��닔 vo=" + vo);
			return cnt;

		} finally {
			pool.dbClose(ps, con);
		}
	}

	public List<PdVO> selectAll(String keyword) throws SQLException { // �쟾泥댁“�쉶, 寃��깋

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		List<PdVO> list = new ArrayList<PdVO>();
		try {
			// 1,2
			con = pool.getConnection();

			// 3
			String sql = "select * from pd";
			if (keyword != null && !keyword.isEmpty()) {
				sql += " where pTitle like '%' || ? || '%'";
			}
			sql += " order by pNo desc";
			ps = con.prepareStatement(sql);

			if (keyword != null && !keyword.isEmpty()) {
				ps.setString(1, keyword);
			}

			// 4
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

			System.out.println("�쟾泥� 議고쉶 寃곌낵 list.size=" + list.size() + ", 留ㅺ컻蹂��닔 keyword=" + keyword);

			return list;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}

	public List<PdVO> selectByCategory(String code) throws SQLException { // 移댄뀒怨좊━濡� 議고쉶

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		List<PdVO> list = new ArrayList<PdVO>();
		try {
			// 1,2
			con = pool.getConnection();

			//
			String sql = "select * from pd where cCode=?";
			ps = con.prepareStatement(sql);

			ps.setString(1, code);

			// 4
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

			System.out.println("category 議고쉶 寃곌낵 list.size=" + list.size() + ", 留ㅺ컻蹂��닔 code=" + code);

			return list;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}

	public PdVO selectByNo(int pno) throws SQLException {

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		PdVO vo = new PdVO();

		try {

			// 1,2
			con = pool.getConnection();

			// 3
			String sql = "select * from pd where pno=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, pno);
			rs = ps.executeQuery();

			if (rs.next()) {
				vo.setpNo(pno);
				vo.setcCode(rs.getString("cCode"));
				vo.setSellerNo(rs.getInt("sellerNo"));
				vo.setpTitle(rs.getString("pTitle"));
				vo.setPrice(rs.getInt("price"));
				vo.setDetail(rs.getString("detail"));
				vo.setReadcount(rs.getInt("readcount"));
				vo.setRegdate(rs.getTimestamp("regdate"));
				vo.setSaleflag(rs.getString("saleflag"));
				vo.setBuyerNo(rs.getInt("buyerNo"));
				
				// �뙆�씪
				vo.setFileName(rs.getString("fileName"));
				vo.setFileSize(rs.getLong("fileSize"));
				vo.setOriginalFilename(rs.getString("originalFilename"));

				System.out.println("寃뚯떆湲� �긽�꽭蹂닿린 寃곌낵 vo=" + vo + ", 留ㅺ컻蹂��닔 pno=" + pno);
			}
			return vo;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int updateSaleflag(int pno, int mno) throws SQLException {

		Connection con = null;
		PreparedStatement ps = null;
		
		try {

			// 1,2
			con = pool.getConnection();

			// 3
			String sql = "update pd set saleflag='Y', buyerNo=? where pno=?";
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, mno);
			ps.setInt(2, pno);
			int cnt = ps.executeUpdate();

			System.out.println("판매플래그 업데이트 결과 cnt=" + cnt);
			return cnt;
		
			
		} finally {
			pool.dbClose(ps, con);
		}
	}
		
	// �뙋留ㅻ궡�뿭�뿉�꽌 議고쉶
		public List<PdVO> selectBySellerNo(int mNo, String keyword, boolean isSaling, boolean isSaled) throws SQLException { 
			
			Connection con=null;
			PreparedStatement ps=null;
			ResultSet rs=null;
			
			List<PdVO> list = new ArrayList<PdVO>();
			
			try {
				// 1,2
				con = pool.getConnection();
				
				//
				String sql = "select * from pd where sellerNo = ?";
				
				// �몮 �떎 泥댄겕媛� �븘�땶 寃쎌슦 (ex. on off or off on)
				if(!(isSaling && isSaled)) {
					if(isSaling) {
						sql += " and saleflag = 'N'";
					} 
					if(isSaled) {
						sql += " and saleflag = 'Y'";
					}
				}
				
				if(keyword != null && !keyword.isEmpty()) {
					sql += " and pTitle like '%' || ? || '%'";
				}
				
				sql += " order by pno desc";
				
				ps = con.prepareStatement(sql);
				ps.setInt(1, mNo);
				
				if(keyword != null && !keyword.isEmpty()) {
					ps.setString(2, keyword);
				}

				// 4
				rs = ps.executeQuery();
				while (rs.next()) {

					int pNo=rs.getInt("pNo");
					String cCode=rs.getString("cCode");
					int sellerNo=rs.getInt("sellerNo");
					String pTitle=rs.getString("pTitle");
					int price=rs.getInt("price");
					String detail=rs.getString("detail");
					int readcount=rs.getInt("readcount");
					Timestamp regdate=rs.getTimestamp("regdate");
					String saleflag = rs.getString("saleflag");
					int buyerNo = rs.getInt("buyerNo");

					//�뙆�씪
					String fileName=rs.getString("fileName");
					String originalFilename=rs.getString("originalFilename");
					long fileSize=rs.getLong("fileSize");

					PdVO vo = new PdVO(pNo, cCode, sellerNo, pTitle, price, detail, regdate, saleflag, buyerNo, fileName, fileSize,
							originalFilename, readcount);
					list.add(vo);
				}

				System.out.println("�뙋留ㅻ궡�뿭 議고쉶 寃곌낵 list.size=" + list.size()
					+ ", 留ㅺ컻蹂��닔 mNo/keyword=" + mNo + "/ " + keyword);
				

				return list;
				
			} finally {
				pool.dbClose(rs, ps, con);
			}
		}
		
		public List<PdVO> selectByBuyerNo(int mNo, String keyword) throws SQLException { 	// 援щℓ�궡�뿭�뿉�꽌 議고쉶

			Connection con=null;
			PreparedStatement ps=null;
			ResultSet rs=null;
			
			List<PdVO> list = new ArrayList<PdVO>();
			
			try {
				// 1,2
				con = pool.getConnection();

				// 
				String sql = "select *"
						+ " from pd"
						+ " where buyerNo = ?";
				
				if(keyword != null && !keyword.isEmpty()) {
					sql += " and pTitle like '%' || ? || '%'";
				}
				
				sql += " order by pNo desc";
				
				System.out.println("??"+sql);
				
				ps = con.prepareStatement(sql);
				ps.setInt(1, mNo);
				
				if(keyword != null && !keyword.isEmpty()) {
					ps.setString(2, keyword);
				}

				// 4
				rs = ps.executeQuery();
				while (rs.next()) {

					int pNo=rs.getInt("pNo");
					String cCode=rs.getString("cCode");
					int sellerNo=rs.getInt("sellerNo");
					String pTitle=rs.getString("pTitle");
					int price=rs.getInt("price");
					String detail=rs.getString("detail");
					int readcount=rs.getInt("readcount");
					Timestamp regdate=rs.getTimestamp("regdate");
					String saleflag = rs.getString("saleflag");
					int buyerNo = rs.getInt("buyerNo");
					
					//�뙆�씪
					String fileName=rs.getString("fileName");
					String originalFilename=rs.getString("originalFilename");
					long fileSize=rs.getLong("fileSize");

					PdVO vo = new PdVO(pNo, cCode, sellerNo, pTitle, price, detail, regdate, saleflag, buyerNo, fileName, fileSize,
							originalFilename, readcount);	
					list.add(vo);
				}

				System.out.println(
						"援щℓ�궡�뿭 議고쉶 寃곌낵 list.size=" + list.size() 
						+ ", 留ㅺ컻蹂��닔 mNo/keyword=" + mNo + "/" + keyword);

				return list;
				
			} finally {
				pool.dbClose(rs, ps, con);
			}
		}
		
		public int updateCount(int pno) throws SQLException { //조회수 증가
			Connection con = null;
			PreparedStatement ps = null;

			try {
				con = pool.getConnection();

				String sql = "update pd set readcount=readcount+1" + " where pno=?";
				ps = con.prepareStatement(sql);
				ps.setInt(1, pno);

				int cnt = ps.executeUpdate();
				System.out.println("조회수 증가 결과 cnt=" + cnt + ", 매개변수 pno=" + pno);

				return cnt;
			} finally {
				pool.dbClose(ps, con);
			}
		}

		
}
