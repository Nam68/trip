package travel.aaacontroller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import travel.cityPlace.service.CityPlaceService;
import travel.placeRegist.model.PlaceRegistDTO;
import travel.placeRegist.service.PlaceRegistService;
import travel.user.service.TripUserService;

@Controller
public class AdminController {
	
	@Autowired
	private TripUserService tu_service;
	@Autowired
	private PlaceRegistService pr_service;
	@Autowired
	private CityPlaceService cp_service;
	
	public AdminController() {
		
	}
	
	@RequestMapping(value = "/adminLogin.do", method = RequestMethod.POST)
	@ResponseBody
	public int adminLogin(String id, String pwd, HttpSession session) {
		return tu_service.adminLogin(id, pwd, session);
	}
	
	
	
	@RequestMapping(value = "/adminPage.do", method = RequestMethod.POST)
	public ModelAndView adminPage() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("cities", pr_service.placeRegistList());
		mav.addObject("menu", "home");
		mav.setViewName("admin/admin");
		return mav;
	}
	
	@RequestMapping(value = "/adminCityList.do", method = RequestMethod.POST)
	public ModelAndView adminCityList(@RequestParam(defaultValue = "1")int cp) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("cities", pr_service.placeRegistList());
		mav.addObject("menu", "city");		
		mav.addObject("sidemenu", "list");	
		mav.addObject("pagination", pr_service.getPlaceRegistListPageNav(cp));
		mav.setViewName("admin/adminCityList");
		return mav;
	}
	
	@RequestMapping(value = "/adminCityAdd.do", method = RequestMethod.POST)
	public ModelAndView adminCityAdd() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("cities", pr_service.placeRegistList());
		mav.addObject("menu", "city");		
		mav.addObject("sidemenu", "add");
		mav.setViewName("admin/adminCityAdd");
		return mav;
	}
	
	@RequestMapping(value = "/adminCityNameAdd.do", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String adminCityNameAdd(String kname) {
		String msg = pr_service.placeRegistAdd(kname)>0? "등록에 성공했습니다.":"등록에 실패했습니다.";
		return msg;
	}
	
	@RequestMapping(value = "/adminCityEditor.do", method = RequestMethod.POST)
	public ModelAndView adminCityEditor(@RequestParam(defaultValue = "0")String ridx) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("cities", pr_service.placeRegistList());
		mav.addObject("menu", "city");		
		mav.addObject("sidemenu", "editor");
		mav.addObject("ridx", ridx);
		mav.addObject("city", pr_service.placeRegistSelect(Integer.parseInt(ridx)));
		mav.addObject("places", cp_service.cityPlaceList(Integer.parseInt(ridx)));	
		mav.setViewName("admin/adminCityEditor");
		return mav;
	}
	
	@RequestMapping(value = "/adminCityNameChange.do", produces = "aplication/text;charset=UTF-8")
	@ResponseBody
	public String adminCityNameChange(String kname, int ridx) {
		String msg = pr_service.placeRegistKnameUpdate(kname, ridx)>0? "변경했습니다.":"변경에 실패했습니다.";
		return msg;
	}
	
	@RequestMapping(value = "/adminCityDelete.do", method = RequestMethod.POST)
	public ModelAndView adminCityDelete() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("cities", pr_service.placeRegistList());
		mav.addObject("menu", "city");		
		mav.addObject("sidemenu", "delete");	
		mav.setViewName("admin/adminCityDelete");
		return mav;
	}
	
	@RequestMapping(value = "/adminCityDelete.do", method = RequestMethod.GET, produces = "aplication/text;charset=UTF-8")
	@ResponseBody
	public String adminCityDelete(int ridx) {
		String msg = pr_service.placeRegistDelete(ridx)>0? "삭제에 성공했습니다.":"삭제에 실패했습니다.";
		return msg;
	}
	
	@RequestMapping(value = "/adminPlaceList.do", method = RequestMethod.POST)
	public ModelAndView adminPlace(@RequestParam(defaultValue = "0")int ridx, @RequestParam(defaultValue = "1")int cp) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("cities", pr_service.placeRegistList());
		mav.addObject("menu", "place");	
		mav.addObject("sidemenu", "list");	
		mav.addObject("places", cp_service.cityPlaceList(ridx));
		mav.addObject("pagination", cp_service.getCityPlaceListPageNav(cp, ridx));
		mav.addObject("ridx", ridx);	
		mav.setViewName("admin/adminPlaceList");
		return mav;
	}
	
	@RequestMapping(value = "/adminPlaceAdd.do", method = RequestMethod.POST)
	public ModelAndView adminPlaceAdd(@RequestParam(defaultValue = "0")int ridx) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("cities", pr_service.placeRegistList());
		mav.addObject("menu", "place");	
		mav.addObject("sidemenu", "add");	
		mav.addObject("ridx", ridx);	
		mav.setViewName("admin/adminPlaceAdd");	
		return mav;
	}
	
	@RequestMapping(value = "/adminPlaceAdd.do", method = RequestMethod.GET, produces = "aplication/text;charset=UTF-8")
	@ResponseBody
	public String adminPlaceAdd(int ridx, String kname, String img, double lat, double lng, String addr) {
		String msg = cp_service.cityPlaceInsert(ridx, kname, img, lat, lng, addr)>0? "등록에 성공했습니다.":"등록에 실패했습니다.";
		return msg;
	}
	
	@RequestMapping(value = "/adminPlaceEditor.do", method = RequestMethod.POST)
	public ModelAndView adminPlaceEditor(int ridx, int pidx) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("cities", pr_service.placeRegistList());
		mav.addObject("menu", "place");	
		mav.addObject("sidemenu", "edit");	
		mav.addObject("place", cp_service.cityPlaceSelect(pidx));	
		mav.setViewName("admin/adminPlaceEditor");
		return mav;
	}
	
	@RequestMapping(value = "/adminPlaceEditor.do", method = RequestMethod.GET, produces = "aplication/text;charset=UTF-8")
	@ResponseBody
	public String adminPlaceEditor(int pidx, String param) {
		String msg = cp_service.cityPlaceUpdate(pidx, param)>0? "변경에 성공했습니다":"변경에 실패했습니다.";
		return msg;
	}
	
	@RequestMapping(value = "/adminPlaceDelete.do", method = RequestMethod.POST)
	public ModelAndView adminPlaceDelete(@RequestParam(defaultValue = "0")int ridx) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("cities", pr_service.placeRegistList());
		mav.addObject("places", cp_service.cityPlaceList(ridx));
		mav.addObject("menu", "place");		
		mav.addObject("sidemenu", "delete");	
		mav.addObject("ridx", ridx);
		mav.setViewName("admin/adminPlaceDelete");
		return mav;
	}
	
	@RequestMapping(value = "/placesInSelectedCity.do", produces = "aplication/text;charset=UTF-8")
	@ResponseBody
	public String placesInSelectedCity(int ridx) {
		List places = cp_service.cityPlaceList(ridx);
		Map map = cp_service.getCityPlaceListMap(places);
		JSONObject json = new JSONObject(map);
		return json.toString();
	}
	
	@RequestMapping(value = "/adminPlaceDelete.do", method = RequestMethod.GET, produces = "aplication/text;charset=UTF-8")
	@ResponseBody
	public String adminPlaceDeleteSubmit(int pidx) {
		String msg = cp_service.cityPlaceDelete(pidx)>0? "삭제에 성공했습니다.":"삭제에 실패했습니다.";
		return msg;
	}
	
}
