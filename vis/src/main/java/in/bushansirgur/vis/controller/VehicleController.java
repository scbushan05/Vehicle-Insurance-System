package in.bushansirgur.vis.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import in.bushansirgur.vis.constants.ApplicationConstants;
import in.bushansirgur.vis.dao.VehicleDAO;
import in.bushansirgur.vis.model.VehicleModel;

/**
 * Represents the controller for vehicle related use cases
 * */
@Controller
public class VehicleController {

	@Autowired
	VehicleDAO vehicleDAO;
	
	/**
	 * Retrieve the vehicle form for adding
	 * @param userId
	 * @return Vehicle form
	 * */
	@RequestMapping(value = "/vehicleForm")
	public ModelAndView showVehicleForm(@RequestParam("userId") int userId) {
		ModelAndView mav = new ModelAndView(ApplicationConstants.MASTER_PAGE);
		VehicleModel vehicle = null;
		vehicle = vehicleDAO.getVehicleBasedOnUserId(userId);
		if(vehicle != null) {
			/**
			 * vehicle found for the user id
			 * populate the vehicle details
			 * */
			mav.addObject("vehicle", vehicle);
		}else {
			/**
			 * vehicle not found for the user id
			 * create a new vehicle object and pass user id
			 * */
			mav.addObject("userId", userId);
			mav.addObject("vehicle", new VehicleModel());
		}
		mav.addObject(ApplicationConstants.TITLE, ApplicationConstants.VEHICLE);
		mav.addObject("userClickVehicleForm", true);
		return mav;
	}
	
	/**
	 * Saves/Update the vehicle data
	 * @param vehicle
	 * @return Vehicle list
	 * */
	@RequestMapping("/saveVehicleData")
	public ModelAndView saveVehicle(@ModelAttribute("vehicle") VehicleModel vehicle) {
		ModelAndView mav = new ModelAndView(ApplicationConstants.MASTER_PAGE);
		if(vehicle.getId() == null) {
			if(vehicleDAO.save(vehicle)) {
				mav.addObject(ApplicationConstants.MSG, "Data Saved");
				mav.addObject("successDialog", true);
			}
		}else {
			if(vehicleDAO.save(vehicle)) {
				mav.addObject(ApplicationConstants.MSG, "Data Updated");
				mav.addObject("updateDialog", true);
			}
		}
		mav.addObject(ApplicationConstants.TITLE, ApplicationConstants.VEHICLE);
		mav.addObject("userClicksVehicle", true);
		mav.addObject("list", vehicleDAO.list());
		return mav;
	}
	
	/**
	 * Retrieve the vehicle form for edit
	 * @param id
	 * @return Vehicle form
	 * */
	@RequestMapping(value = "/editVehicle")
	public ModelAndView editVehicle(@RequestParam("id") int id) {
		ModelAndView mav = new ModelAndView(ApplicationConstants.MASTER_PAGE);
		mav.addObject("vehicle", vehicleDAO.get(id));
		mav.addObject(ApplicationConstants.TITLE, ApplicationConstants.VEHICLE);
		mav.addObject("userClickVehicleForm", true);
		mav.addObject("readOnly", true);
		return mav;
	}
	
	/**
	 * Delete the vehicle data
	 * @param id
	 * @return Vehicle list
	 * */
	@RequestMapping(value = "/deleteVehicle")
	public ModelAndView deleteVehicle(@RequestParam("id") int id) {
		ModelAndView mav = new ModelAndView(ApplicationConstants.MASTER_PAGE);
		if(vehicleDAO.delete(id)) {
			mav.addObject("deleteDialog", true);
			mav.addObject(ApplicationConstants.MSG, "Data Deleted");
		}
		mav.addObject(ApplicationConstants.TITLE, ApplicationConstants.VEHICLE);
		mav.addObject("userClicksVehicle", true);
		return mav;
	}
}
