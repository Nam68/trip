package travel.cityPlace.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class CityPlaceDAOImple implements CityPlaceDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	public CityPlaceDAOImple() {
		
	}
	
	public List cityPlaceList() {
		return sqlMap.selectList("cityPlaceList");
	}
	
	public List cityPlaceSearchList(int ridx) {
		return sqlMap.selectList("cityPlaceList", ridx);
	}
	
	public int cityPlaceCount() {
		return sqlMap.selectOne("cityPlaceCount");
	}
	
	public int cityPlaceSearchCount(int ridx) {
		return sqlMap.selectOne("cityPlaceSearchCount", ridx);
	}
	
}
