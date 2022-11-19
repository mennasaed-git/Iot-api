package Vois.Controller;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.TypedQuery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import Vois.Entities.*;
import Vois.Services.DeviceService;


@RestController
public class DeviceController {
	
	@Autowired
	 private DeviceService deviceService ;
	
	
	
	@RequestMapping("/hello")
    @ResponseBody
	public String hello()
	{
		return "Hello World";
	}
	
	@RequestMapping("/devices")
    @ResponseBody
	public List<Device> Devices()
	{
		return  deviceService.findAll();
		
	}
	
	//devices needs to be activated
	@RequestMapping("/DevicesWaitingForActivation")
	@ResponseBody
	public List<Device> DevicesNeedActivation()
	{
		
		return  deviceService.GetDevicesWaitingForActivation();
					
	}
	
	//return an ordered result of devices available for sale
	@RequestMapping("/DevicesAvailableForSale")
    @ResponseBody
	public List<Device> DevicesaAvailableForSale()
	{
		
		return  deviceService.GetAvailableDevicesForSale();
		
	}
	
	//update device configuration
	@RequestMapping(value="/UpdateDevice/{id}" , method = RequestMethod.PUT)
	@ResponseBody
	public ResponseEntity<String> UpdateDeviceStatus(@PathVariable("id") String id, @RequestBody String status)
	{
		
		var x = deviceService.UpdateDeviceConfigurationStatus(Long.valueOf(id), status);
		if(x)
		{
			return ResponseEntity.status(HttpStatus.OK).body("Status Updated Successfully");
		}
		else
		{
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("");
		}
	   
	}
	
	//remove device configuration status
	//@RequestMapping("/RemoveDevice")
	//@ResponseBody
//	public List<Device> RemoveDevice()
	//{
	//return  (List<Device>) deviceRepository.findAll();
				
	//}
	

}
