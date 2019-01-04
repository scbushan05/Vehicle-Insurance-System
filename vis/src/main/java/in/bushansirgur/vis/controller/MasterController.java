package in.bushansirgur.vis.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import in.bushansirgur.vis.constants.ApplicationConstants;
import in.bushansirgur.vis.dao.InsuranceDAO;
import in.bushansirgur.vis.dao.UserDAO;
import in.bushansirgur.vis.dao.VehicleDAO;
import in.bushansirgur.vis.model.SearchModel;

/**
 * Represents the controller for the home page related use cases
 * */
@Controller
public class MasterController {
	
	@Autowired
	UserDAO userDAO;
	
	@Autowired
	InsuranceDAO insuranceDAO;
	
	@Autowired
	VehicleDAO vehicleDAO;
	
	/**
	 * @return home page
	 * */
	@RequestMapping(value = {"/", "/index", "/home"})
	public ModelAndView showHome() {
		ModelAndView mav = new ModelAndView(ApplicationConstants.MASTER_PAGE);
		mav.addObject(ApplicationConstants.TITLE, ApplicationConstants.HOME);
		mav.addObject("userClicksHome", true);
		return mav;
	}
	
	/**
	 * @return User list
	 * */
	@RequestMapping(value = "/user")
	public ModelAndView showUser() {
		ModelAndView mav = new ModelAndView(ApplicationConstants.MASTER_PAGE);
		mav.addObject(ApplicationConstants.TITLE, ApplicationConstants.USER);
		mav.addObject("userClicksUser", true);
		mav.addObject("list", userDAO.list());
		return mav;
	}
	
	/**
	 * @return Insurance list
	 * */
	@RequestMapping(value = "/insurance")
	public ModelAndView showInsurance() {
		ModelAndView mav = new ModelAndView(ApplicationConstants.MASTER_PAGE);
		mav.addObject(ApplicationConstants.TITLE, ApplicationConstants.INSURANCE);
		mav.addObject("userClicksInsurance", true);
		mav.addObject("list", insuranceDAO.list());
		return mav;
	}
	
	/**
	 * @return Vehicle list
	 * */
	@RequestMapping(value = "/vehicle")
	public ModelAndView showVehicle() {
		ModelAndView mav = new ModelAndView(ApplicationConstants.MASTER_PAGE);
		mav.addObject(ApplicationConstants.TITLE, ApplicationConstants.VEHICLE);
		mav.addObject("userClicksVehicle", true);
		mav.addObject("list", vehicleDAO.list());
		return mav;
	}
	
	/**
	 * @return login form
	 * */
	@RequestMapping(value = "/logout")
	public ModelAndView showLogout() {
		ModelAndView mav = new ModelAndView("login");
		return mav;
	}
	
	/**
	 * @return access denied page
	 * */
	@RequestMapping(value = "/access-denied")
	public ModelAndView accessDenied() {
		ModelAndView mav = new ModelAndView("access-denied");
		return mav;
	}
	
	/**
	 * @return search form
	 * */
	@RequestMapping(value = "/search/searchView")
	public ModelAndView search() {
		ModelAndView mav = new ModelAndView(ApplicationConstants.MASTER_PAGE);
		mav.addObject(ApplicationConstants.TITLE, ApplicationConstants.SEARCH);
		mav.addObject("userClicksSearch", true);
		mav.addObject("search", new SearchModel());
		return mav;
	}
}
