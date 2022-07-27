package com.salguMarket.sales.model;

import java.sql.SQLException;
import java.util.List;

public class SalesService {
	private SalesDAO dao;
	
	public SalesService() {
		dao = new SalesDAO();
	}
	
	public int insertSales(int dNo) throws SQLException {
		return dao.insertSales(dNo);
	}
	
	public List<SalesVO> selectSalesByDNo(int dNo) throws SQLException {
		return dao.selectSalesByDNo(dNo);
	}
}
