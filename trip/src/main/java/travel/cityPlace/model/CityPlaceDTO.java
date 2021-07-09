package travel.cityPlace.model;

public class CityPlaceDTO {
	
	private int pidx;
	private int ridx;
	private String jname;
	private String kname;
	private String img;
	private double lat;
	private double lng;
	private String addr;
	
	public CityPlaceDTO() {
		
	}

	public CityPlaceDTO(int pidx, int ridx, String jname, String kname, String img, double lat, double lng,
			String addr) {
		super();
		this.pidx = pidx;
		this.ridx = ridx;
		this.jname = jname;
		this.kname = kname;
		this.img = img;
		this.lat = lat;
		this.lng = lng;
		this.addr = addr;
	}

	public int getPidx() {
		return pidx;
	}

	public void setPidx(int pidx) {
		this.pidx = pidx;
	}

	public int getRidx() {
		return ridx;
	}

	public void setRidx(int ridx) {
		this.ridx = ridx;
	}

	public String getJname() {
		return jname;
	}

	public void setJname(String jname) {
		this.jname = jname;
	}

	public String getKname() {
		return kname;
	}

	public void setKname(String kname) {
		this.kname = kname;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}
	
}
