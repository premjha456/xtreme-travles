package com.xtremetravles.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/bus/booking/payment")
public class PaymentController {

	@RequestMapping("/success")
	public ModelAndView paymentSuccess(){
		 
		ModelAndView mv = new ModelAndView("index");

		mv.addObject("clickedPaymentSuccess", true);

		return mv;
	}


	@RequestMapping("/fail")
	public ModelAndView paymentFail(){
		 
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("clickedPaymentFail", true);

		return mv;
	}

	
	@RequestMapping("/cancel")
	public ModelAndView paymentCancel(){
		 
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("clickedPaymentCancel", true);

		return mv;
	}

}
