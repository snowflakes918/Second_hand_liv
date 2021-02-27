package com.ldu.controller;

import com.alibaba.druid.stat.TableStat;
import com.ldu.pojo.Admin;
import com.ldu.service.AdminService;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService am;

	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("index");
		String strPhone = request.getParameter("phone");
		String strPassword = request.getParameter("password");

		Admin admin = am.findAdmin(Long.parseLong(strPhone), strPassword);
		modelAndView.addObject("admin", admin);
		return modelAndView;
	}

}