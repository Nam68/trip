package travel.aaacontroller;

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
		return "admin/admin";
	}
	
	@RequestMapping(value = "/citySelected.do", method = RequestMethod.POST)
	public ModelAndView citySelected(int ridx, @RequestParam(defaultValue = "1")int cp) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/admin");
		mav.addObject("placeList", cp_service.cityPlaceList(ridx));
		return mav;
	}
	
}
