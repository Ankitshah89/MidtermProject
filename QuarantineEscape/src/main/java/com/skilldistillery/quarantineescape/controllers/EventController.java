package com.skilldistillery.quarantineescape.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.quarantineescape.data.EventDAO;
import com.skilldistillery.quarantineescape.entities.Event;
import com.skilldistillery.quarantineescape.entities.User;

@Controller
public class EventController {

	@Autowired
	private EventDAO dao;
	
	@RequestMapping(path = "findEvent.do", method = RequestMethod.GET, params = "id")
	public String findEventById(@RequestParam int id, Model model) {
		String view = "Event";
		Event event = dao.findEventById(id);
		model.addAttribute("event", event);
		return view;
	}
	@RequestMapping(path = "createEvent.do", method = RequestMethod.GET)
	public ModelAndView createEvent(Event event) {
		dao.createEvent(event);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
	
	
	
}
