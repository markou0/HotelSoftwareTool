package com.markkryzh.hotel_software_tool;

import static org.junit.Assert.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.markkryzh.hotel_software_tool.repository.UserRepository;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("root-context.xml")

public class JUnitSpringExample {
	@PersistenceContext
	private EntityManager em;
	@Autowired
	private UserRepository userRepository;

	@Test
	public void testSampleService() {
		// ApplicationContext context = new
		// ClassPathXmlApplicationContext("context.xml");
		// RoomBookingController t1000 = (RoomBookingController)
		// context.getBean("t1000");
		// userRepository = new MyLauncherImpl();
		// t1000.getRoomBookingRepository();
		assertNotNull(userRepository);
	}

}
