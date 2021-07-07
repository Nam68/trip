package travel.placeRegist.model;

public class PlaceRegistDTO {
	
	private int ridx;
	private String jname;
	private String kname;
	
	public PlaceRegistDTO() {
		
	}

	public PlaceRegistDTO(int ridx, String jname, String kname) {
		super();
		this.ridx = ridx;
		this.jname = jname;
		this.kname = kname;
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
	
}
