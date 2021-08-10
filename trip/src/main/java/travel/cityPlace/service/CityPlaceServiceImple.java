package travel.cityPlace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import travel.aaamodule.PageMudule;
import travel.cityPlace.model.CityPlaceDAO;

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
	
	public String getCityPlaceListPageNav(int cp, int ridx) {
		int total = ridx==0? dao.cityPlaceCount():dao.cityPlaceSearchCount(ridx);
		return page.getPageNav(cp, total, listSize, pageSize, "ridx", ridx, "adminPlaceList.do");
	}

}
