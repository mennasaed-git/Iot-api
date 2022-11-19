package Vois.Entities;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="Device")
@JsonIgnoreProperties(value={"handler","hibernateLazyInitializer","FieldHandler"}) 
public class Device {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long ID;
	
	private String Name;
	private byte Temperature;
	
	private boolean Sold;
	
	@OneToOne(cascade = CascadeType.ALL , fetch = FetchType.LAZY)
	@JoinColumn(name = "SIMCard_id", referencedColumnName = "SIMID")
	private SIMCard SimCard;
	
	
	public Long getID() {
		return ID;
	}
	
	public String getName() {
		return Name;
	}
	
	public void setName(String name) {
		Name = name;
	}
	
	public byte getTemperature() {
		return Temperature;
	}
	
	public void setTemperature(byte temperature) {
		Temperature = temperature;
	}
	
	public boolean getSold() {
		return Sold;
	}
	
	public void setSold(boolean isSold) {
	    Sold = isSold;
	  }
	
	public SIMCard getSimCard() {
        return SimCard;
    }

    public void setSimCard(SIMCard simCard) {
    	SimCard = simCard;
    }
	
}
