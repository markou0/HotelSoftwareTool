package com.markkryzh.hotel_software_tool.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.markkryzh.hotel_software_tool.model.Room;
import com.markkryzh.hotel_software_tool.model.RoomType;

public interface RoomRepository extends JpaRepository<Room, Integer> {
	Room findOneByNumber(String number);

	List<Room> findByRoomType(RoomType roomType);

	List<Room> findByCapacityEquals(int capacity);
}
