package travel.cityPlace.service;

import java.util.List;

public interface CityPlaceService {
	
	public int listSize = 10;
	public int pageSize = 5;
	
	public List cityPlaceList(int ridx);
	public String getCityPlaceListPageNav(int cp, int ridx);
	
}
