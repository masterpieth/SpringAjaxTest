package com.sesoc.ajaxtest;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sesoc.ajaxtest.dao.BoardDAO;
import com.sesoc.ajaxtest.vo.AjaxBoard;
import com.sesoc.ajaxtest.vo.Customer;

@Controller
public class AjaxController {

	@Autowired
	private BoardDAO dao;
	
	
	@RequestMapping(value = "headernfooter", method = RequestMethod.GET)
	public String headernfooter() {
		return "headernfooter";
	}
	
	@RequestMapping(value = "ajaxBasic", method = RequestMethod.GET)
	public String ajaxBasic() {
		return "ajaxBasic";
	}
	
	// 비동기 통신(ajax)에서의 요청을 받아주는 controller의 method에 붙는 annotation
	// 어디서 오는 요청인지 잘 보기~
	@ResponseBody
	@RequestMapping(value = "ajaxtest1", method = RequestMethod.GET)
	public String ajaxtest1() {
		System.out.println("ajax 요청");
		// return 값 -> 요청한 곳으로 응답을 전달할 때 함께 전달되는 값
		// 결과는 요청한 곳의 success function의 매개로 전달됨
		return "test";
	}
	@RequestMapping(value = "ajaxObject", method = RequestMethod.GET)
	public String ajaxObject() {
		return "ajaxObject";
	}
	
	@ResponseBody
	@RequestMapping(value = "ajaxtest2", method = RequestMethod.GET)
	public boolean ajaxtest2(String custId, String custPw, int custAge, boolean custFlag) {
		boolean flag = false;
		System.out.println("custId : " + custId);
		System.out.println("custPw : " + custPw);
		System.out.println("custAge : " + custAge);
		System.out.println("custFlag : " + custFlag);
		return flag;
	}
	
	@ResponseBody
	@RequestMapping(value = "ajaxtest3", method = RequestMethod.POST)
	public Customer ajaxtest3(Customer customer) {
		System.out.println(customer);
		customer.setCustId("admin");
		customer.setCustFlag(true);
		return customer;
	}
	@ResponseBody
	@RequestMapping(value = "ajaxtest4", method = RequestMethod.POST)
	public void ajaxtest4(@RequestBody Customer customer) {
		System.out.println(customer);
	}
	@ResponseBody
	@RequestMapping(value = "ajaxtest5", method = RequestMethod.GET)
	public ArrayList<Customer> ajaxtest5() {
		ArrayList<String> strList = new ArrayList<String>();
		strList.add("aaa");
		strList.add("bbb");
		strList.add("ccc");
		Customer c1 = new Customer("test1", "test1", 11, false, null);
		Customer c2 = new Customer("test2", "test2", 20, true, strList);
		ArrayList<Customer> list = new ArrayList<Customer>();
		list.add(c1);
		list.add(c2);
		return list;
	}
	@RequestMapping(value = "ajaxBoard", method = RequestMethod.GET)
	public String ajaxBoard(Model model, String temp) {
		String str = "abc";
		//글 목록 조회
		ArrayList<AjaxBoard> list = dao.selectBoard();
		model.addAttribute("list", list);
		
		str += temp;
		return "ajaxBoard";
	}
	
	@ResponseBody
	@RequestMapping(value = "insertBoard", method = RequestMethod.POST)
	public ArrayList<AjaxBoard> insertBoard (AjaxBoard ajaxBoard) {
		dao.insertBoard(ajaxBoard);
		ArrayList<AjaxBoard> list = dao.selectBoard();
		return list;
	}
	@ResponseBody
	@RequestMapping(value = "deleteBoard", method = RequestMethod.GET)
	public ArrayList<AjaxBoard> deleteBoard (int board_no) {
		dao.deleteBoard(board_no);
		ArrayList<AjaxBoard> list = dao.selectBoard();
		return list;
	}
}
