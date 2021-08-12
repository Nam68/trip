package travel.cityPlace.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import travel.aaamodule.PageMudule;
import travel.cityPlace.model.CityPlaceDAO;
import travel.cityPlace.model.CityPlaceDTO;

public class CityPlaceServiceImple implements CityPlaceService {
	
	@Autowired
	private CityPlaceDAO dao;
	@Autowired
	private PageMudule page;
	
	public CityPlaceServiceImple() {
		
	}
	
	public List cityPlaceList(int ridx) {
		if(ridx == 0) return dao.cityPlaceList();
		else return dao.cityPlaceSearchList(ridx);
	}
	
	public CityPlaceDTO cityPlaceSelect(int pidx) {
		return dao.cityPlaceSelect(pidx);
	}
	
	public String getCityPlaceListPageNav(int cp, int ridx) {
		int total = ridx==0? dao.cityPlaceCount():dao.cityPlaceSearchCount(ridx);
		return page.getPageNav(cp, total, listSize, pageSize, "ridx", ridx, "adminPlaceList.do");
	}
	
	public int cityPlaceInsert(int ridx, String kname, String img, double lat, double lng, String addr) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ridx", ridx);
		map.put("kname", kname);
		map.put("img", img);
		map.put("lat", lat);
		map.put("lng", lng);
		map.put("addr", addr);
		return dao.cityPlaceInsert(map);
	}
	
	public int cityPlaceUpdate(int ridx, String kname, double lat, double lng, String addr, String img) {
		
		
		
		return 0;
	}

}
