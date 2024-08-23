package com.becoder.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpServletRequest;

import com.becoder.dao.EmpDao;
import com.becoder.dao.UserDao;
import com.becoder.entity.Emp;
import com.becoder.entity.User;
import com.mysql.cj.Session;

@Controller
public class HomeController {

	@Autowired
	private EmpDao empDao;
	
	@Autowired
	private UserDao userDao;
	
	@RequestMapping(path = "/home")
	public String home(Model m) {
		List<Emp> list = empDao.getAllEmp();
		m.addAttribute("empList" , list);
		System.out.println("===============================");
		System.out.println("Home Method Working");
		for(Emp n : list) {
			System.out.println(n);
		}
		return "home";
	}
	
	@RequestMapping(path = "/addEmp")
	public String addEmp() {
		return "addEmp";
	}
	
	@RequestMapping(path = "/createEmp" , method = RequestMethod.POST)
	public String createEmp(@ModelAttribute Emp emp, HttpSession session) {
		System.out.println("===============================");
		System.out.println("Create Emp Method Working");
		System.out.println(emp);
		int i = empDao.saveEmp(emp);
		System.out.println("Result data Store"+i);
		session.setAttribute("msg", "Register Successfully");
		return "redirect:/addEmp";
	}
	
	@RequestMapping(path = "/editEmp/{id}")
	public String editEmp(@PathVariable int id, Model m) {
		System.out.println("edit is working");
		Emp emp = empDao.getEmpById(id);
		m.addAttribute("emp", emp);
		System.out.println(emp);
		
		return "editEmp";
	}
	
	@RequestMapping(path = "/updateEmp" , method = RequestMethod.POST)
	public String updateEmp(@ModelAttribute Emp emp, HttpSession session) {
		System.out.println("===============================");
		System.out.println("Edit method is working");
		empDao.update(emp);
		session.setAttribute("msg","update  Successfully");
		return "redirect:/home";
	}
	
	@RequestMapping(path = "/deleteEmp/{id}")
	public String deleteEmp(@PathVariable int id, HttpSession session) {
		System.out.println("===============================");
		System.out.println("Delete method is working");
		empDao.deleteEmp(id);
		session.setAttribute("msg","Deleted  Successfully");
		return "redirect:/home";
	}
	
	@RequestMapping(path = "/register")
	public String registerPage() {
		return "register";
	}
	
	@RequestMapping(path = "/login")
	public String loginPage() {
		return "login";
	}
	
	@RequestMapping(path ="/createUser",  method = RequestMethod.POST)
	public String register(@ModelAttribute User user, HttpSession session) {
	    int i = userDao.saveUser(user);
	    System.out.println("User registeration done");
		session.setAttribute("msg", "User Register Successfully");
		System.out.println(user);
		return"redirect:/register";
	}
	
	@RequestMapping(path = "/userlogin" , method = RequestMethod.POST)
	public String login(@RequestParam("email") String em,@RequestParam("password") String pwd, HttpSession session) {
		System.out.println("login Method working");
		User user = userDao.loginUser(em, pwd);
		if(user != null) {
			session.setAttribute("loginuser", user);
			return "profile";
		}else {
			session.setAttribute("msg", "User Not exist");
		return "redirect:/login";
		}
	}
	
	@RequestMapping("/myprofile")
	public String myProfile() {
		
		return "profile";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpSession sess) {
		sess.setAttribute("msg", "Logout successfully");
		HttpSession session = request.getSession();
		session.removeAttribute("loginuser");
		return "login";
	}
}
