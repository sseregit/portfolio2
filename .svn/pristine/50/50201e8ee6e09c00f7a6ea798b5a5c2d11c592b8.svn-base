package com.iot.pf.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.iot.pf.dto.User;
import com.iot.pf.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService us;
	
	@RequestMapping("/list.do")
	@ResponseBody
	public ArrayList<User> list(@RequestParam HashMap<String,Object> params) {
		
		return 	us.list(params);
		
	}

	@RequestMapping("/userList.do")
	public ModelAndView userList(@RequestParam HashMap<String,Object> params) {
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("form-general2");
		
		return 	mv;
		
	}

	
}
