package com.markkryzh.hotel_software_tool.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.markkryzh.hotel_software_tool.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
	User findByName(String name);

	User findByEmail(String email);
}
