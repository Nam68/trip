package travel.user.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import travel.user.model.TripUserDAO;
import travel.user.model.UserDTO;

public class TripUserServiceImple implements TripUserService {

	@Autowired
	private TripUserDAO dao;
	
	public TripUserServiceImple() {
		
	}
	
	public int userLogin(String id, String pwd, HttpSession session) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		UserDTO dto = dao.tripUserLogin(map);
		if(dto == null) {
			return TripUserDAO.LOGIN_FAILED;
		} else {
			session.setAttribute("userDTO", dto);
			return TripUserDAO.LOGIN_SUCCESS;
		}
	}

	public int adminLogin(String id, String pwd, HttpSession session) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		UserDTO dto = dao.tripUserLogin(map);
		if(dto == null) {
			return TripUserDAO.LOGIN_FAILED;
		} else if(dto != null && dto.getUseridx() != 0) {
			return TripUserDAO.NOT_ADMIN;
		} else {
			session.setAttribute("userDTO", dto);
			return TripUserDAO.LOGIN_SUCCESS;
		}
	}

}
