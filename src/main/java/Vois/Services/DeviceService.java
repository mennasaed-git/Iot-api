package Vois.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Vois.Entities.Device;
import Vois.Entities.Status;
import Vois.Repository.DeviceRepository;

@Service
public class DeviceService {

	@Autowired
	 private DeviceRepository deviceRepository ;
	
	public List<Device> GetAvailableDevicesForSale()
	{
		var s = Status.READY;
		return  deviceRepository.getAvailabledDevicesForSale(s.name());
	}
	
	public List<Device> GetDevicesWaitingForActivation()
	{
		var s = Status.WaitingForActivation;
		return  deviceRepository.getDevicesByStatus(s.name());
	}
	
	public boolean UpdateDeviceConfigurationStatus(Long deviceId ,  String status )
	{
	
		var result = deviceRepository.UpdateDeviceStatus(status , deviceId );
		if( result > 0)
		{
		 return true;
		}
		
		else
		{	return false;}
		
	}
	
	public List<Device> findAll()
	{	
		return  deviceRepository.findAll();
	}
}

