package in.bushansirgur.vis.model;

import javax.persistence.Column;
import javax.persistence.Entity;

public class SearchModel {
	private String username;
	private String licenceNo;
	private String plateNo;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getLicenceNo() {
		return licenceNo;
	}
	public void setLicenceNo(String licenceNo) {
		this.licenceNo = licenceNo;
	}
	public String getPlateNo() {
		return plateNo;
	}
	public void setPlateNo(String plateNo) {
		this.plateNo = plateNo;
	}
	
	
}
