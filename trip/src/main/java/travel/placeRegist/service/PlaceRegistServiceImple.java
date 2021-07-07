package travel.placeRegist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import travel.placeRegist.model.PlaceRegistDAO;

public class PlaceRegistServiceImple implements PlaceRegistService {
	
	@Autowired
	private PlaceRegistDAO dao;
	
	public PlaceRegistServiceImple() {
		
	}	
	
	public List placeRegistList() {
		return dao.placeRegistList();
	}

}
