package travel.cityPlace.model;

import java.util.List;
import java.util.Map;

public interface CityPlaceDAO {
	
	public List cityPlaceList();
	public List cityPlaceSearchList(int ridx);
	public int cityPlaceCount();
	public int cityPlaceSearchCount(int ridx);
	public CityPlaceDTO cityPlaceSelect(int pidx);
	public int cityPlaceInsert(Map<String, Object> map);
	
	public int cityPlaceRidxUpdate(Map<String, Object> map);
	public int cityPlaceKnameUpdate(Map<String, Object> map);
	public int cityPlaceAddressUpdate(Map<String, Object> map);
	public int cityPlaceImgUpdate(Map<String, Object> map);
}
