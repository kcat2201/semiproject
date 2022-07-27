package com.salguMarket.deal.model;

import java.sql.SQLException;
import java.util.List;

public class DealService {
	private DealDAO dao;
	
	public DealService() {
		dao = new DealDAO();
	}
	
	public int insertDeal(int bNo, int buyerNo) throws SQLException {
		return dao.insertDeal(bNo, buyerNo);
	}
	
	public List<DealVO> selectDealByNo(int buyerNo) throws SQLException {
		return dao.selectDealByBuyerNo(buyerNo);
	}
	
	public boolean isDealed(int pNo) throws SQLException {
		return dao.isDealed(pNo);
	}
}
