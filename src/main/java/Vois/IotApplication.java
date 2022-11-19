package Vois;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import Vois.Entities.Device;
import Vois.Repository.DeviceRepository;

import java.util.List;

@SpringBootApplication
public class IotApplication implements CommandLineRunner {

	@Autowired
	 private DeviceRepository deviceRepository ;
	 
	public static void main(String[] args) {
		SpringApplication.run(IotApplication.class, args);
		System.out.println("hello from main");
		
	}
	
	@Override
	public void run (String... args) throws Exception
	{
		 List<Device> dvs =	(List<Device>) deviceRepository.findAll();
		 dvs.forEach(System.out :: println);
	}

}
