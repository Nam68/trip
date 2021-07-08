package travel.user.model;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class TripUserDAOImple implements TripUserDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	public TripUserDAOImple() {
		
	}
	
	public UserDTO tripUserLogin(Map<String, String> map) {
		return sqlMap.selectOne("tripUserLogin", map);
	}

}
