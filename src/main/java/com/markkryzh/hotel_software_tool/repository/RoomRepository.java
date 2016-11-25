package com.markkryzh.hotel_software_tool.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.markkryzh.hotel_software_tool.model.Room;

public interface RoomRepository extends JpaRepository<Room, Integer> {

}
