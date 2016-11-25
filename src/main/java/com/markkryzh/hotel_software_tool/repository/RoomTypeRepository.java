package com.markkryzh.hotel_software_tool.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.markkryzh.hotel_software_tool.model.RoomType;

public interface RoomTypeRepository extends JpaRepository<RoomType, Integer> {
	RoomType findOneByName(String name);
}
