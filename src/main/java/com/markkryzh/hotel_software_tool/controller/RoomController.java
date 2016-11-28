package com.markkryzh.hotel_software_tool.controller;

import java.text.ParseException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String createRoom(@ModelAttribute Room room) {
		room.setRoomType(roomTypeRepository.findOneByName(room.getRoomTypeName()));
		roomRepository.save(room);
		return "redirect:/" + tableName + "s";
	}

	@RequestMapping(value = "/" + tableName + "/remove", method = RequestMethod.POST)
	public String deleteRoom(@RequestParam Integer id) {
		if (roomRepository.exists(id))
			roomRepository.delete(id);
		return "redirect:/" + tableName + "s";
	}

	@RequestMapping(value = "/roomsByType", method = RequestMethod.GET, produces = { "text/html; charset=UTF-8" })
	public @ResponseBody String getRoomsByType(@RequestParam String roomTypeName) {
		String result = "";
		List<Room> rooms = roomRepository.findByRoomType(roomTypeRepository.findOneByName(roomTypeName));
		if (rooms == null)
			return "";
		int[] capacities = new int[rooms.size()];
		for (int i = 0; i < rooms.size(); i++) {
			capacities[i] = rooms.get(i).getCapacity();
		}
		Arrays.sort(capacities);
		if (rooms.size() > 1)
			for (int i = 1; i < rooms.size(); i++) {
				int capacity = rooms.get(i).getCapacity();
				if (capacity != rooms.get(i - 1).getCapacity())
					result += "<option value='" + capacity + "'>" + capacity + "</option>";
			}
		else if (rooms.size() > 0)
			result += "<option value='" + capacities[0] + "'>" + capacities[0] + "</option>";
		return result;
	}

	@RequestMapping(value = "/roomsByCapacity", method = RequestMethod.GET, produces = { "text/html; charset=UTF-8" })
	public @ResponseBody String getRoomsByCapacity(@RequestParam int roomCapacity) {
		String result = "";
		List<Room> rooms = roomRepository.findByCapacityEquals(roomCapacity);
		if (rooms == null)
			return "";
		for (Room room : rooms) {
			result += "<option value='" + room.getNumber() + "'>" + room.getNumber() + "</option>";
		}
		return result;
	}

	@RequestMapping(value = "/checkBookingRoom", method = RequestMethod.GET, produces = { "text/html; charset=UTF-8" })
	public @ResponseBody String getRoomsByCapacity(@RequestParam String roomNumber, @RequestParam String dateFrom,
			@RequestParam String dateTo) throws ParseException {
		LocalDate startDate = LocalDate.parse(dateFrom);
		LocalDate endtDate = LocalDate.parse(dateTo);
		// Range = End date - Start date
		Long range = ChronoUnit.DAYS.between(startDate, endtDate);
		System.out.println("Number of days between the start date : " + dateFrom + " and end date : " + endtDate
				+ " is  ==> " + range);

		range = ChronoUnit.DAYS.between(startDate, endtDate);
		System.err.println(range);
		double price = roomRepository.findOneByNumber(roomNumber).getPrice();
		return range * price + "";
	}
}
