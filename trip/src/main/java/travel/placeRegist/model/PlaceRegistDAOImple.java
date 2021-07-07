package travel.placeRegist.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class PlaceRegistDAOImple implements PlaceRegistDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	public PlaceRegistDAOImple() {
		
	}
	
	public List placeRegistList() {
		return sqlMap.selectList("placeRegistList");
	}

}
