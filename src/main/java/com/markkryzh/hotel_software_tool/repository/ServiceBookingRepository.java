package com.markkryzh.hotel_software_tool.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.markkryzh.hotel_software_tool.model.ServiceBooking;
import com.markkryzh.hotel_software_tool.model.User;

public interface ServiceBookingRepository extends JpaRepository<ServiceBooking, Integer> {
	List<ServiceBooking> findByUser(User user);
}
