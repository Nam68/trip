package travel.placeRegist.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import travel.aaamodule.PageMudule;
import travel.placeRegist.model.PlaceRegistDAO;
import travel.placeRegist.model.PlaceRegistDTO;

public class PlaceRegistServiceImple implements PlaceRegistService {
	
	@Autowired
	private PlaceRegistDAO dao;
	@Autowired
	private PageMudule page;
	
	public PlaceRegistServiceImple() {
		
	}	
	
	public List placeRegistList() {
		return dao.placeRegistList();
	}
	
	public PlaceRegistDTO placeRegistSelect(int ridx) {
		return dao.placeRegistSelect(ridx);
	}
	
	public int placeRegistAdd(String kname) {
		return dao.placeRegistAdd(kname);
	}
	
	public int placeRegistKnameUpdate(String kname, int ridx) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("kname", kname);
		map.put("ridx", ridx);
		return dao.placeRegistKnameUpdate(map);
	}
	
	public int placeRegistDelete(int ridx) {
		return dao.placeRegistDelete(ridx);
	}
	
	public String getPlaceRegistListPageNav(int cp) {
		int total = dao.placeRegistCount();
		return page.getPageNav(cp, total, listSize, pageSize, "adminCityList.do");
	}

}
