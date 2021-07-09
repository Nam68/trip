package travel.cityPlace.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class CityPlaceDAOImple implements CityPlaceDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	public CityPlaceDAOImple() {
		
	}
	
	public List cityPlaceList(int ridx) {
		return sqlMap.selectList("cityPlaceList", ridx);
	}

}
