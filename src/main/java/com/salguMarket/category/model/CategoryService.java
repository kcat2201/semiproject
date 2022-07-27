package com.salguMarket.category.model;

import java.sql.SQLException;
import java.util.List;

import com.salguMarket.pd.model.PdVO;

//DB�옉�뾽 �씠�쇅�쓽 濡쒖쭅�쓣 �떞�뒗 �겢�옒�뒪
/*
jsp -> DAO
jsp -> Service -> DAO 
*/

public class CategoryService {
	private CategoryDAO categoryDao;
	
	public CategoryService() {
		categoryDao=new CategoryDAO();
	}
	
	public List<PdVO> selectAll(String keyword) throws SQLException {
		return categoryDao.selectAll(keyword);
	}
	
	public List<PdVO> selectByCategory(String category) throws SQLException {
		return categoryDao.selectByCategory(category);
	}
	
	public String selectCateBycCode(String cCode2) throws SQLException { 
		return categoryDao.selectCateBycCode(cCode2);
	}
}
