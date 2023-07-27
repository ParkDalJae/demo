package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Model model) {
		System.out.println("home controller start");
		
		model.addAttribute("name", "UserController");
        return "index";
    }

}