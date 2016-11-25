package com.markkryzh.hotel_software_tool.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.markkryzh.hotel_software_tool.model.Room;
import com.markkryzh.hotel_software_tool.model.RoomType;
import com.markkryzh.hotel_software_tool.repository.RoomRepository;
import com.markkryzh.hotel_software_tool.repository.RoomTypeRepository;
import com.markkryzh.hotel_software_tool.repository.UserRepository;

@Controller
public class RoomController {

	final String tableName = "room";
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private RoomRepository roomRepository;
	@Autowired
	private RoomTypeRepository roomTypeRepository;

	/**
	 * Simply selects the template view to render by returning its name.
	 */
	@RequestMapping(value = "/" + tableName + "s", method = RequestMethod.GET)
	public String template(Model model) {
		List<RoomType> roomTypes = roomTypeRepository.findAll();
		List<Room> rooms = roomRepository.findAll();
		model.addAttribute("rooms", rooms);
		model.addAttribute("roomTypes", roomTypes);
		model.addAttribute("tableName", tableName);
		model.addAttribute("content", tableName + "Table");
		return "template";
	}

	@RequestMapping(value = "/room/edit", method = RequestMethod.POST)
	public String editRoom(@ModelAttribute Room roomForm) {
		Room room = roomRepository.findOne(roomForm.getId());
		room.setRoomType(roomTypeRepository.findOneByName(roomForm.getRoomTypeName()));
		room.setCapacity(roomForm.getCapacity());
		room.setPrice(roomForm.getPrice());
		room.setNumber(roomForm.getNumber());
		roomRepository.save(room);
		return "redirect:/";
	}

	@RequestMapping(value = "/room/create", method = RequestMethod.POST)
	public String createRoom(@ModelAttribute Room room) {
		roomRepository.save(room);
		return "redirect:/";
	}

	@RequestMapping(value = "/room/remove", method = RequestMethod.POST)
	public String deleteRoom(@RequestParam Integer id) {
		if (roomRepository.exists(id))
			roomRepository.delete(id);
		return "redirect:/";
	}

}
