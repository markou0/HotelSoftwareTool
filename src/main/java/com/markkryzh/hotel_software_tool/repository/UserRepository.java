package com.markkryzh.hotel_software_tool.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.markkryzh.hotel_software_tool.model.User;

public interface UserRepository extends JpaRepository<User, Integer> {
}
