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
	
}
