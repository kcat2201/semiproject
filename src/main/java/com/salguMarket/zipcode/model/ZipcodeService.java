package com.salguMarket.zipcode.model;

import java.sql.SQLException;
import java.util.List;

public class ZipcodeService {
	public ZipcodeDAO zipDao;

	public ZipcodeService() {
		zipDao=new ZipcodeDAO();
	}

	public List<ZipcodeVO> selectAll(String dong) throws SQLException{
		return zipDao.selectAll(dong);
	}

}
