package travel.aaacontroller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
	public String adminPage(Model model) {
		model.addAttribute("cities", pr_service.placeRegistList());
		model.addAttribute("menu", "home");		
		return "admin/admin";
	}
	
	@RequestMapping(value = "/adminCityList.do", method = RequestMethod.POST)
	public String adminCityList(Model model, @RequestParam(defaultValue = "1")int cp) {
		model.addAttribute("cities", pr_service.placeRegistList());
		model.addAttribute("menu", "city");		
		model.addAttribute("sidemenu", "list");	
		model.addAttribute("pagination", pr_service.getPlaceRegistListPageNav(cp));
		return "admin/adminCityList";
	}
	
	@RequestMapping(value = "/adminCityAdd.do", method = RequestMethod.POST)
	public String adminCityAdd(Model model) {
		model.addAttribute("cities", pr_service.placeRegistList());
		model.addAttribute("menu", "city");		
		model.addAttribute("sidemenu", "add");
		return "admin/adminCityAdd";
	}
	
	@RequestMapping(value = "/adminCityNameAdd.do", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String adminCityNameAdd(String kname) {
		String msg = pr_service.placeRegistAdd(kname)>0? "등록에 성공했습니다.":"등록에 실패했습니다.";
		return msg;
	}
	
	@RequestMapping(value = "/adminCityEditor.do", method = RequestMethod.POST)
	public String adminCityEditor(Model model, @RequestParam(defaultValue = "0")String ridx) {
		model.addAttribute("cities", pr_service.placeRegistList());
		model.addAttribute("menu", "city");		
		model.addAttribute("sidemenu", "editor");
		model.addAttribute("ridx", ridx);
		model.addAttribute("city", pr_service.placeRegistSelect(Integer.parseInt(ridx)));
		model.addAttribute("places", cp_service.cityPlaceList(Integer.parseInt(ridx)));
		return "admin/adminCityEditor";
	}
	
	@RequestMapping(value = "/adminCityNameChange.do", produces = "aplication/text;charset=UTF-8")
	@ResponseBody
	public String adminCityNameChange(String kname, int ridx) {
		String msg = pr_service.placeRegistKnameUpdate(kname, ridx)>0? "변경했습니다.":"변경에 실패했습니다.";
		return msg;
	}
	
	@RequestMapping(value = "/adminPlaceList.do", method = RequestMethod.POST)
	public String adminPlace(Model model, @RequestParam(defaultValue = "0")int ridx, @RequestParam(defaultValue = "1")int cp) {
		model.addAttribute("cities", pr_service.placeRegistList());
		model.addAttribute("menu", "place");	
		model.addAttribute("sidemenu", "list");	
		model.addAttribute("places", cp_service.cityPlaceList(ridx));
		model.addAttribute("pagination", cp_service.getCityPlaceListPageNav(cp, ridx));
		model.addAttribute("ridx", ridx);	
		return "admin/adminPlaceList";
	}
	
	
	
	
	
	
	@RequestMapping(value = "/placeList.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView placeList(int ridx, @RequestParam(defaultValue = "1")int cp) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/placeList");
		mav.addObject("placeList", cp_service.cityPlaceList(ridx));
		mav.addObject("ridx", ridx);
		mav.addObject("cities", pr_service.placeRegistList());
		return mav;
	}
	
	@RequestMapping(value = "/placeAdd.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView placeAdd(int ridx) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/placeAdd");
		mav.addObject("ridx", ridx);
		mav.addObject("cities", pr_service.placeRegistList());
		return mav;
	}
	
}
