package com.markkryzh.hotel_software_tool.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.markkryzh.hotel_software_tool.model.Service;
import com.markkryzh.hotel_software_tool.repository.ServiceRepository;

@Controller
public class ServiceController {

	final String tableName = "service";
	@Autowired
	private ServiceRepository serviceRepository;

	@RequestMapping(value = "/" + tableName + "s", method = RequestMethod.GET)
	public String template(Model model) {
		List<Service> services = serviceRepository.findAll();
		model.addAttribute(tableName + "s", services);
		model.addAttribute("tableName", tableName);
		model.addAttribute("content", tableName + "Table");
		return "template";
	}

	@RequestMapping(value = "/" + tableName + "/edit", method = RequestMethod.POST)
	public String editService(@ModelAttribute Service serviceForm) {
		Service service = serviceRepository.findOne(serviceForm.getId());
		service.setDescription(serviceForm.getDescription());
		service.setCapacity(serviceForm.getCapacity());
		service.setPrice(serviceForm.getPrice());
		service.setName(serviceForm.getName());
		serviceRepository.save(service);
		return "redirect:/" + tableName + "s";
	}

	@RequestMapping(value = "/" + tableName + "/create", method = RequestMethod.POST)
	public String createService(@ModelAttribute Service service) {
		serviceRepository.save(service);
		return "redirect:/" + tableName + "s";
	}

	@RequestMapping(value = "/" + tableName + "/remove", method = RequestMethod.POST)
	public String deleteService(@RequestParam Integer id) {
		if (serviceRepository.exists(id))
			serviceRepository.delete(id);
		return "redirect:/" + tableName + "s";
	}

	@RequestMapping(value = "servicePrice", method = RequestMethod.GET)
	@ResponseBody
	public String getServicePrice(@RequestParam String serviceName) {
		serviceRepository.findOneByName(serviceName).getPrice();
		return serviceRepository.findOneByName(serviceName).getPrice() + "";
	}

}
