package com.tjoeun.spring.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;




@Controller
@RequestMapping("/member")
public class MemberController {


	
	@RequestMapping("/signIn")
	public String signIn(Model model) {
		
		
		
		return "member/signIn";
	}
	
	
	
	@RequestMapping("/signUp")
	public String signUp(Model model) {
		
	
		
		return "member/signUp";
	}
	
	
	
	
	
	
	
	
	
	
	
}
