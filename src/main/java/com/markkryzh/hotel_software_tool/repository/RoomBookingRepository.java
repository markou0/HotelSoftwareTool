package com.markkryzh.hotel_software_tool.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.markkryzh.hotel_software_tool.model.RoomBooking;

public interface RoomBookingRepository extends JpaRepository<RoomBooking, Integer> {

}
