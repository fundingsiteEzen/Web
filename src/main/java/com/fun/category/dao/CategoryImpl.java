package com.fun.category.dao;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.fun.category.dto.CategoryDTO;

//------------------------------------------------------------------------------------------------------------
// public interface CategoryIMPI extends CategoryDAO
//------------------------------------------------------------------------------------------------------------
@Repository 
public interface CategoryImpl extends CategoryDAO {
	
	@Inject
	private SqlSession sqlsession;
	
	private static String namespace = "com.fun.category";

	// ------------------------------------------------------------------------------------------------------------
	// 봄 카테고리 목록 띄우기
	// ------------------------------------------------------------------------------------------------------------
	@Override
	public List<CategoryDTO> categoryList() throws Exception {

		System.out.println("CategoryDAOImpl categoryList() 시작");
		
		List<CategoryDTO> categoryList = sqlSession.selectList(namespace + ".listAll");
		
		System.out.println("CategoryDAOImpl categoryList() Data ==> " + categoryList);
		
		return categoryList;
		
	}
	
} // End -public interface CategoryIMPI extends CategoryDAO
