package travel.placeRegist.model;

import java.util.List;
import java.util.Map;

public interface PlaceRegistDAO {
	
	public List placeRegistList();
	public PlaceRegistDTO placeRegistSelect(int ridx);
	public int placeRegistCount();
	public int placeRegistAdd(String kname);
	public int placeRegistKnameUpdate(Map<String, Object> map);
	
}
