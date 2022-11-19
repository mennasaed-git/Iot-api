package Vois.Repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import Vois.Entities.Device;

@Repository
public interface DeviceRepository extends JpaRepository<Device , Long> {
	
	   @Query(value = "SELECT * FROM device d join simcard sc on d.simcard_id=sc.simid where sc.status = :s", nativeQuery = true)
	   List<Device> findByCardStatus(@Param("s")String stat);
	   
	  @Query(value = "SELECT * FROM device d join simcard sc on d.simcard_id = sc.simid where sc.status = :status and "
	  		+ " d.sold <> 1 and  d.Temperature between -25 and 85 Order by d.name ASC", nativeQuery = true)
	  List<Device> getAvailabledDevicesForSale(@Param("status")String status);
	  
	  @Query(value = "SELECT * FROM device d join simcard sc on d.simcard_id = sc.simid where sc.status = :status and  d.sold <> 1 ", nativeQuery = true)
	  List<Device> getDevicesByStatus(@Param("status")String status);
	  
	  @Transactional
	  @Modifying
	  @Query(value = "UPDATE simcard SET status =:s From simcard join device on device.simcard_id = simcard.simid Where device.id = :deviceid", nativeQuery = true)
	  int UpdateDeviceStatus(@Param("s")String stat ,@Param("deviceid") Long deviceId);
}
