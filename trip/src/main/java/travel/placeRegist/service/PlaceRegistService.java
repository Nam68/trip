package travel.placeRegist.service;

import java.util.List;

import travel.placeRegist.model.PlaceRegistDTO;

public interface PlaceRegistService {
	
	public int listSize = 10;
	public int pageSize = 5;
	
	public List placeRegistList();
	public PlaceRegistDTO placeRegistSelect(int ridx);
	public int placeRegistAdd(String kname);
	public int placeRegistKnameUpdate(String kname, int ridx);
	public int placeRegistDelete(int ridx);
	
	public String getPlaceRegistListPageNav(int cp);
	

}
