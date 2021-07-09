package travel.cityPlace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import travel.cityPlace.model.CityPlaceDAO;

public class CityPlaceServiceImple implements CityPlaceService {
	
	@Autowired
	private CityPlaceDAO dao;
	
	public CityPlaceServiceImple() {
		
	}
	
	public List cityPlaceList(int ridx) {
		return dao.cityPlaceList(ridx);
	}

}
