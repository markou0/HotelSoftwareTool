package com.markkryzh.hotel_software_tool.controller;

import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.markkryzh.hotel_software_tool.model.Room;
import com.markkryzh.hotel_software_tool.model.RoomBooking;
import com.markkryzh.hotel_software_tool.model.RoomType;
import com.markkryzh.hotel_software_tool.model.User;
import com.markkryzh.hotel_software_tool.repository.RoomBookingRepository;
import com.markkryzh.hotel_software_tool.repository.RoomRepository;
import com.markkryzh.hotel_software_tool.repository.RoomTypeRepository;
import com.markkryzh.hotel_software_tool.repository.UserRepository;

@Controller
public class RoomBookingController {

	final String tableName = "roomBooking";
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private RoomRepository roomRepository;
	@Autowired
	private RoomTypeRepository roomTypeRepository;
	@Autowired
	private RoomBookingRepository roomBookingRepository;

	@RequestMapping(value = "/" + tableName + "s", method = RequestMethod.GET)
	public String template(Model model, Principal principal) {
		User user = null;
		List<RoomType> roomTypes = roomTypeRepository.findAll();
		List<Room> rooms = roomRepository.findAll();
		List<RoomBooking> roomBookings;
		if (principal == null)
			return "template";
		user = userRepository.findByEmail(principal.getName());
		if (user.getRole().equals("ADMIN"))
			roomBookings = roomBookingRepository.findAll();
		else
			roomBookings = roomBookingRepository.findByUser(user);
		model.addAttribute("roomBookings", roomBookings);
		model.addAttribute("roomTypes", roomTypes);
		model.addAttribute("rooms", rooms);
		model.addAttribute("tableName", tableName);
		model.addAttribute("content", tableName + "Table");
		return "template";
	}

	@RequestMapping(value = "/" + tableName + "/create", method = RequestMethod.POST)
	public String createRoomBooking(@RequestParam String roomNumber, @RequestParam String dateFrom,
			@RequestParam String dateTo, Principal principal) throws ParseException {
		RoomBooking roomBooking = new RoomBooking();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
		LocalDate startDate = LocalDate.parse(dateFrom);
		LocalDate endtDate = LocalDate.parse(dateTo);
		Long range = ChronoUnit.DAYS.between(startDate, endtDate);
		double price = roomRepository.findOneByNumber(roomNumber).getPrice() * range;
		roomBooking.setPrice(price);
		roomBooking.setRoom(roomRepository.findOneByNumber(roomNumber));
		roomBooking.setUser(userRepository.findByEmail(principal.getName()));
		roomBooking.setFromDate(formatter.parse(dateFrom));
		roomBooking.setToDate(formatter.parse(dateTo));
		roomBookingRepository.save(roomBooking);
		return "redirect:/" + tableName + "s";
	}

	@RequestMapping(value = "/" + tableName + "/edit", method = RequestMethod.POST)
	public String editRoomBooking(@RequestParam int id, @RequestParam String roomNumber, @RequestParam String dateFrom,
			@RequestParam String dateTo, Principal principal) throws ParseException {
		RoomBooking roomBooking = roomBookingRepository.findOne(id);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
		LocalDate startDate = LocalDate.parse(dateFrom);
		LocalDate endtDate = LocalDate.parse(dateTo);
		Long range = ChronoUnit.DAYS.between(startDate, endtDate);
		double price = roomRepository.findOneByNumber(roomNumber).getPrice() * range;
		roomBooking.setPrice(price);
		roomBooking.setRoom(roomRepository.findOneByNumber(roomNumber));
		roomBooking.setFromDate(formatter.parse(dateFrom));
		roomBooking.setToDate(formatter.parse(dateTo));
		roomBookingRepository.save(roomBooking);
		return "redirect:/" + tableName + "s";
	}

	@RequestMapping(value = "/" + tableName + "/remove", method = RequestMethod.POST)
	public String deleteRoomBooking(@RequestParam Integer id) {
		if (roomBookingRepository.exists(id))
			roomBookingRepository.delete(id);
		return "redirect:/" + tableName + "s";
	}
}
