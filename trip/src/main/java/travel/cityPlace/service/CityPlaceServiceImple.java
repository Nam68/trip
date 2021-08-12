package travel.cityPlace.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
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
	
	public int cityPlaceUpdate(int pidx, String param) {
		Map<String, Object> map = new HashMap<String, Object>();
        JSONObject json = new JSONObject(String.valueOf(param));
        Iterator<String> i = json.keys();
        while(i.hasNext()){
             String k = i.next().toString();
             map.put(k, json.get(k));
        }
        map.put("pidx", pidx);
        
        if(map.get("ridx")!=null) {
        	return dao.cityPlaceRidxUpdate(map);
        } else if(map.get("kname")!=null) {
        	return dao.cityPlaceKnameUpdate(map);
        } else if(map.get("addr")!=null) {
        	return dao.cityPlaceAddressUpdate(map);
        } else if(map.get("img")!=null) {
        	return dao.cityPlaceImgUpdate(map);
        } else {
        	return 0;
        }
	}

}
