package travel.user.service;

import javax.servlet.http.HttpSession;

public interface TripUserService {
	
	public int userLogin(String id, String pwd, HttpSession session);
	public int adminLogin(String id, String pwd, HttpSession session);
	
}
