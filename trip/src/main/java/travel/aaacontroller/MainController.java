package travel.aaacontroller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	public MainController() {
		
	}	
	
	@RequestMapping("/main.do")
	public String mainPage(int ridx, Model model) {
		
		return "main/main";
	}
}
