package com.salguMarket.nboard.model;

import java.sql.SQLException;
import java.util.List;

public class NboardService {
	private NboardDAO nboardDao;
	
	public NboardService() {
		nboardDao = new NboardDAO();
	}
	
	public int insertNboard(NboardVO vo) throws SQLException {
		return nboardDao.insertNboard(vo);
	}
	
	public List<NboardVO> selectAll(String condition, String keyword) throws SQLException{
		return nboardDao.selectAll(condition, keyword);
	}
	
	public NboardVO selectByNo(int nNo) throws SQLException {
		return nboardDao.selectByNo(nNo);
	}
	
	public int updateNboard(NboardVO vo) throws SQLException {
		return nboardDao.updateNboard(vo);
	}
	
	public int deleteNboard(int nNo) throws SQLException {
		return nboardDao.deleteNboard(nNo);
	}
	
	public int updateCount(int nNo) throws SQLException {
		return nboardDao.updateCount(nNo);
	}
	
	public int updateDownCount(int nNo) throws SQLException {
		return nboardDao.updateDownCount(nNo);
	}
		
}
