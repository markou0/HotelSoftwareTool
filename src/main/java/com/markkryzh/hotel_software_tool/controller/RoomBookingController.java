package com.markkryzh.hotel_software_tool.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.markkryzh.hotel_software_tool.model.Room;
import com.markkryzh.hotel_software_tool.model.RoomBooking;
import com.markkryzh.hotel_software_tool.model.RoomType;
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
	public String template(Model model) {
		List<RoomType> roomTypes = roomTypeRepository.findAll();
		List<Room> rooms = roomRepository.findAll();
		List<RoomBooking> roomBookings = roomBookingRepository.findAll();
		model.addAttribute("roomsBookings", roomBookings);
		model.addAttribute("roomTypes", roomTypes);
		model.addAttribute("rooms", rooms);
		model.addAttribute("tableName", tableName);
		model.addAttribute("content", tableName + "Table");
		return "template";
	}

	@RequestMapping(value = "/" + tableName + "/edit", method = RequestMethod.POST)
	public String editRoom(@ModelAttribute Room roomForm) {
		Room room = roomRepository.findOne(roomForm.getId());
		room.setRoomType(roomTypeRepository.findOneByName(roomForm.getRoomTypeName()));
		room.setCapacity(roomForm.getCapacity());
		room.setPrice(roomForm.getPrice());
		room.setNumber(roomForm.getNumber());
		roomRepository.save(room);
		return "redirect:/" + tableName + "s";
	}

	@RequestMapping(value = "/" + tableName + "/create", method = RequestMethod.POST)
	public String createRoom(@ModelAttribute RoomBooking roomBooking) throws ParseException {
		roomBooking.setRoom(roomRepository.findOneByNumber(roomBooking.getRoomNumber()));
		// roomBooking.setUser(userRepository.findByName(principal.getName()));
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
		roomBooking.setFrom(formatter.parse(roomBooking.getDateFrom()));
		roomBooking.setTo(formatter.parse(roomBooking.getDateTo()));
		roomBookingRepository.save(roomBooking);
		return "redirect:/" + tableName + "s";
	}

	@RequestMapping(value = "/" + tableName + "/remove", method = RequestMethod.POST)
	public String deleteRoom(@RequestParam Integer id) {
		if (roomRepository.exists(id))
			roomRepository.delete(id);
		return "redirect:/" + tableName + "s";
	}

}
