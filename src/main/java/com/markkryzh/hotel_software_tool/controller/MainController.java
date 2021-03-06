package com.markkryzh.hotel_software_tool.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	String getHome(Model model) {
		model.addAttribute("content", "home");
		return "template";
	}

}
