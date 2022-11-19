package Vois.Entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@JsonIgnoreProperties(value={"handler","hibernateLazyInitializer","FieldHandler"}) 
public class SIMCard {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="SIMID")
	private Long SIMID; 
	
	@Column(name="OperatorCode" , unique=true)
	private Long OperatorCode; 
	
	@Column(name="Country")
	private String Country;
	
	@Column(name="Status")
	@Enumerated(EnumType.STRING)
	private Status Status; 
	
	@OneToOne(fetch=FetchType.LAZY, mappedBy="SimCard")
    private Device device;
	
	public Long getSIMID() {
		return SIMID;
	}
	public void setSIMID(Long sIMID) {
		SIMID = sIMID;
	}
	public Long getOperatorCode() {
		return OperatorCode;
	}
	public void setOperatorCode(Long operatorCode) {
		OperatorCode = operatorCode;
	}
	public String getCountry() {
		return Country;
	}
	public void setCountry(String country) {
		Country = country;
	}
	
	public String getStatus() {
		return Status.name();
	}
	
	public void setStatus(Status status) {
		Status = status;
	}

}
