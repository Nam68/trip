package travel.aaacontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import travel.placeRegist.service.PlaceRegistService;

@Controller
public class IndexController {
	
	@Autowired
	private PlaceRegistService pr_service;
	
	public IndexController() {
		
	}
	
	@RequestMapping("/index.do")
	public String indexPage(Model model) {
		model.addAttribute("cities", pr_service.placeRegistList());
		return "index";
	}
	
}
