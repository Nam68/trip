package travel.cityPlace.service;

import java.util.List;
import java.util.Map;

import travel.cityPlace.model.CityPlaceDTO;

public interface CityPlaceService {
	
	public int listSize = 10;
	public int pageSize = 5;
	
	public List cityPlaceList(int ridx);
	public CityPlaceDTO cityPlaceSelect(int pidx);
	public int cityPlaceInsert(int ridx, String kname, String img, double lat, double lng, String addr);
	public int cityPlaceUpdate(int pidx, String param);
	public int cityPlaceDelete(int pidx);
	
	public Map getCityPlaceListMap(List<CityPlaceDTO> list);
	public String getCityPlaceListPageNav(int cp, int ridx);
	
}
