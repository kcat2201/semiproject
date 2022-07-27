package com.salguMarket.pd.model;

import java.sql.SQLException;
import java.util.List;

//DB�옉�뾽 �씠�쇅�쓽 濡쒖쭅�쓣 �떞�뒗 �겢�옒�뒪
/*
 jsp -> DAO
 jsp -> Service -> DAO

 */
public class PdService {

	private PdDAO pdDao;

	public PdService() {
		pdDao = new PdDAO();
	}

	public int insertPd(PdVO vo) throws SQLException {
		return pdDao.insertPd(vo);
	}

	public int deletePd(int no) throws SQLException {
		return pdDao.deletePd(no);
	}

	public int updatePd(PdVO vo) throws SQLException {
		return pdDao.updatePd(vo);
	}

	public List<PdVO> selectAll(String keyword) throws SQLException {
		return pdDao.selectAll(keyword);
	}

	public List<PdVO> selectByCategory(String code) throws SQLException { 
		return pdDao.selectByCategory(code);
	}

	public PdVO selectByNo(int pno) throws SQLException {
		return pdDao.selectByNo(pno);
	}
	public int updateSaleflag(int pno, int mno) throws SQLException {
		return pdDao.updateSaleflag(pno, mno);
	}
	
	public List<PdVO> selectByBuyerNo(int mNo, String keyword) throws SQLException { 	
		return pdDao.selectByBuyerNo(mNo, keyword);
	}
	
	public List<PdVO> selectBySellerNo(int mNo, String keyword, boolean isSaling, boolean isSaled) throws SQLException {
		return pdDao.selectBySellerNo(mNo, keyword, isSaling, isSaled);
	}

	public int updateCount(int pno) throws SQLException { //조회수 증가
		return pdDao.updateCount(pno);
	}
	
}
