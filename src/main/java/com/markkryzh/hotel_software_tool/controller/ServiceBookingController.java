package com.markkryzh.hotel_software_tool.controller;

import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.markkryzh.hotel_software_tool.model.Service;
import com.markkryzh.hotel_software_tool.model.ServiceBooking;
import com.markkryzh.hotel_software_tool.model.User;
import com.markkryzh.hotel_software_tool.repository.ServiceBookingRepository;
import com.markkryzh.hotel_software_tool.repository.ServiceRepository;
import com.markkryzh.hotel_software_tool.repository.UserRepository;

@Controller
public class ServiceBookingController {

	final String tableName = "serviceBooking";
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private ServiceRepository serviceRepository;
	@Autowired
	private ServiceBookingRepository serviceBookingRepository;

	@RequestMapping(value = "/" + tableName + "s", method = RequestMethod.GET)
	public String template(Model model, Principal principal) {
		User user = null;
		List<Service> services = serviceRepository.findAll();
		List<ServiceBooking> serviceBookings = null;
		if (principal == null)
			return "template";
		user = userRepository.findByEmail(principal.getName());
		if (user.getRole().equals("ADMIN"))
			serviceBookings = serviceBookingRepository.findAll();
		else
			serviceBookings = serviceBookingRepository.findByUser(user);
		model.addAttribute("serviceBookings", serviceBookings);
		model.addAttribute("services", services);
		model.addAttribute("tableName", tableName);
		model.addAttribute("content", tableName + "Table");
		return "template";
	}

	@RequestMapping(value = "/" + tableName + "/create", method = RequestMethod.POST)
	public String createServiceBooking(@RequestParam String serviceName, @RequestParam String atDate,
			@RequestParam String atTime, Principal principal) throws ParseException {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
		SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
		ServiceBooking serviceBooking = new ServiceBooking();
		serviceBooking.setService(serviceRepository.findOneByName(serviceName));
		serviceBooking.setAtDate(dateFormat.parse(atDate));
		serviceBooking.setAtTime(timeFormat.parse(atTime));
		serviceBooking.setUser(userRepository.findByEmail(principal.getName()));
		serviceBookingRepository.save(serviceBooking);
		return "redirect:/" + tableName + "s";
	}

	@RequestMapping(value = "/" + tableName + "/edit", method = RequestMethod.POST)
	public String editServiceBooking(@RequestParam Integer id, @RequestParam String serviceName,
			@RequestParam String atDate, @RequestParam String atTime, Principal principal) throws ParseException {
		ServiceBooking serviceBooking = serviceBookingRepository.findOne(id);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
		SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
		serviceBooking.setService(serviceRepository.findOneByName(serviceName));
		serviceBooking.setAtDate(dateFormat.parse(atDate));
		serviceBooking.setAtTime(timeFormat.parse(atTime));
		serviceBookingRepository.save(serviceBooking);
		return "redirect:/" + tableName + "s";
	}

	// @RequestMapping(value = "/" + tableName + "/create", method =
	// RequestMethod.POST)
	// public String createRoomBooking(@RequestParam String roomNumber,
	// @RequestParam String dateFrom,
	// @RequestParam String dateTo, Principal principal) throws ParseException {
	// RoomBooking roomBooking = new RoomBooking();
	// SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
	// LocalDate startDate = LocalDate.parse(dateFrom);
	// LocalDate endtDate = LocalDate.parse(dateTo);
	// Long range = ChronoUnit.DAYS.between(startDate, endtDate);
	// double price = roomRepository.findOneByNumber(roomNumber).getPrice() *
	// range;
	// roomBooking.setPrice(price);
	// roomBooking.setRoom(roomRepository.findOneByNumber(roomNumber));
	// roomBooking.setUser(userRepository.findAll().get(0));
	// roomBooking.setFromDate(formatter.parse(dateFrom));
	// roomBooking.setToDate(formatter.parse(dateTo));
	// roomBookingRepository.save(roomBooking);
	// return "redirect:/" + tableName + "s";
	// }

	@RequestMapping(value = "/" + tableName + "/remove", method = RequestMethod.POST)
	public String deleteServiceBooking(@RequestParam Integer id) {
		if (serviceBookingRepository.exists(id))
			serviceBookingRepository.delete(id);
		return "redirect:/" + tableName + "s";
	}

}
