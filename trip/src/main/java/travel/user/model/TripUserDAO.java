package travel.user.model;

import java.util.Map;

public interface TripUserDAO {
	
	public static final int LOGIN_SUCCESS = 1;
	public static final int LOGIN_FAILED = -1;
	public static final int NOT_ADMIN = 0;
	
	public UserDTO tripUserLogin(Map<String, String> map);
	
}
