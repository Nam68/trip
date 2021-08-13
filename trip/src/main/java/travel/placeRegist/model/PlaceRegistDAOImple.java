package travel.placeRegist.model;

import java.util.List;
import java.util.Map;

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
	
	public PlaceRegistDTO placeRegistSelect(int ridx) {
		return sqlMap.selectOne("placeRegistSelect", ridx);
	}
	
	public int placeRegistCount() {
		return sqlMap.selectOne("placeRegistCount");
	}
	
	public int placeRegistAdd(String kname) {
		return sqlMap.insert("placeRegistAdd", kname);
	}
	
	public int placeRegistKnameUpdate(Map<String, Object> map) {
		return sqlMap.update("placeRegistKnameUpdate", map);
	}
	
	public int placeRegistDelete(int ridx) {
		return sqlMap.delete("placeRegistDelete", ridx);
	}

}
