package com.salguMarket.qboard.model;

import java.sql.SQLException;
import java.util.List;

public class QboardService {
	private QboardDAO qboardDao;
	
	public QboardService() {
		qboardDao = new QboardDAO();
	}
	
	public int insertQboard(QboardVO vo) throws SQLException {
		return qboardDao.insertQboard(vo);
	}
	
	public List<QboardVO> selectAll(String condition, String keyword) throws SQLException{
		return qboardDao.selectAll(condition, keyword);
	}
	
	public QboardVO selectByNo(int qNo) throws SQLException {
		return qboardDao.selectByNo(qNo);
	}
	
	public int updateQboard(QboardVO vo) throws SQLException {
		return qboardDao.updateQboard(vo);
	}
	
	public int deleteqBoard(int qNo) throws SQLException {
		return qboardDao.deleteqBoard(qNo);
	}
	public int updateCount(int qNo) throws SQLException {
		return qboardDao.updateCount(qNo);
	}
	
	public int reply(QboardVO vo) throws SQLException {
		return qboardDao.reply(vo);
	}
}
