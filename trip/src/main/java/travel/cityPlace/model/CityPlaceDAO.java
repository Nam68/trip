package travel.cityPlace.model;

import java.util.List;

public interface CityPlaceDAO {
	
	public List cityPlaceList();
	public List cityPlaceSearchList(int ridx);
	public int cityPlaceCount();
	public int cityPlaceSearchCount(int ridx);
	
}
