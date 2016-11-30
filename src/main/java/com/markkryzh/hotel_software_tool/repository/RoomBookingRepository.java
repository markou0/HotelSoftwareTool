package com.markkryzh.hotel_software_tool.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.markkryzh.hotel_software_tool.model.RoomBooking;
import com.markkryzh.hotel_software_tool.model.User;

public interface RoomBookingRepository extends JpaRepository<RoomBooking, Integer> {
	List<RoomBooking> findByUser(User user);
}
