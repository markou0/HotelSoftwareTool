package com.markkryzh.hotel_software_tool.validators;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.markkryzh.hotel_software_tool.model.User;
import com.markkryzh.hotel_software_tool.repository.UserRepository;

@Component
public class UserValidator implements Validator {

	@Autowired
	private UserRepository userRepository;

	@Override
	public boolean supports(Class<?> clazz) {
		return User.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		User user = (User) target;
		String password = user.getPassword();
		String confPassword = user.getConfPassword();

		if (!password.equals(confPassword)) {
			errors.rejectValue("password", "user.password.missMatch");
		}

		if (userRepository.findByName(user.getName()) != null) {
			errors.rejectValue("name", "user.username.NonUnique");
		}
		;
	}

}
