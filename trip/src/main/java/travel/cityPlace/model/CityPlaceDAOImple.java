package travel.cityPlace.model;

import java.util.List;
import java.util.Map;

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
		return sqlMap.selectList("cityPlaceSearchList", ridx);
	}
	
	public int cityPlaceCount() {
		return sqlMap.selectOne("cityPlaceCount");
	}
	
	public int cityPlaceSearchCount(int ridx) {
		return sqlMap.selectOne("cityPlaceSearchCount", ridx);
	}
	
	public CityPlaceDTO cityPlaceSelect(int pidx) {
		return sqlMap.selectOne("cityPlaceSelect", pidx);
	}
	
	public int cityPlaceInsert(Map<String, Object> map) {
		return sqlMap.insert("cityPlaceInsert", map);
	}
	
	public int cityPlaceRidxUpdate(Map<String, Object> map) {
		return sqlMap.update("cityPlaceRidxUpdate", map);
	}
	
	public int cityPlaceKnameUpdate(Map<String, Object> map) {
		return sqlMap.update("cityPlaceKnameUpdate", map);
	}
	
	public int cityPlaceAddressUpdate(Map<String, Object> map) {
		return sqlMap.update("cityPlaceAddressUpdate", map);
	}
	
	public int cityPlaceImgUpdate(Map<String, Object> map) {
		return sqlMap.update("cityPlaceImgUpdate", map);
	}
	
	public int cityPlaceDelete(int pidx) {
		return sqlMap.delete("cityPlaceDelete", pidx);
	}
	
}
