package sickSa.mapper;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import sickSa.domain.IngredientCategories;

public class IngredientCategoriesMapperImpl implements IngredientCategoriesMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		System.out.println("sqlSession: " + sqlSession);
		this.sqlSession = sqlSession;
	}
		
	public IngredientCategoriesMapperImpl() {
		System.out.println("IngredientCategoriesDaoImpl Constructor(): "+ this);
	}
	
	@Override
	public List<IngredientCategories> ingredientCategoriesList() {
		return sqlSession.selectList("ingredientCategoriesList");
	}

	@Override
	public IngredientCategories selectIngredientCategoriesById(String igct_name) {
		return sqlSession.selectOne("selectIngredientCategoriesById", igct_name);
	}

	@Override
	public Integer insertIngredientCategories(IngredientCategories ingredientCategories) {
		return sqlSession.insert("insertIngredientCategories",ingredientCategories);
	}

	@Override
	public Integer deleteIngredientCategories(Integer igct_id) {
		return sqlSession.delete("deleteIngredientCategories", igct_id);
	}

	@Override
	public Integer updateIngredientCategories(IngredientCategories ingredientCategories) {
		
		return sqlSession.update("updateIngredientCategories",ingredientCategories);
	}
}