package in.bushansirgur.vis.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "tbl_user")
public class UserModel{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private Integer id;
	@Column
	private String name; 
	@Column
	private String password;
	@Column
	private String gender;
	@Column
	private String nationality;
	@Column
	private String licence;
	@JoinColumn(name = "authority_id")
	@OneToOne
	private Authorities authority;
	@Transient
	private InsuranceModel insuranceModel;
	@Transient
	private VehicleModel vehicleModel;
	
	public UserModel() {}
	
	public UserModel(String name, String password) {
		this.name = name;
		this.password = password;
	}
	
	public InsuranceModel getInsuranceModel() {
		return insuranceModel;
	}

	public void setInsuranceModel(InsuranceModel insuranceModel) {
		this.insuranceModel = insuranceModel;
	}

	public VehicleModel getVehicleModel() {
		return vehicleModel;
	}

	public void setVehicleModel(VehicleModel vehicleModel) {
		this.vehicleModel = vehicleModel;
	}

	public Authorities getAuthority() {
		return authority;
	}

	public void setAuthority(Authorities authority) {
		this.authority = authority;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getLicence() {
		return licence;
	}

	public void setLicence(String licence) {
		this.licence = licence;
	}

	@Override
	public String toString() {
		return "UserModel [id=" + id + ", name=" + name + ", password=" + password + ", gender=" + gender
				+ ", nationality=" + nationality + ", licence=" + licence + ", authority=" + authority
				+ ", insuranceModel=" + insuranceModel + ", vehicleModel=" + vehicleModel + "]";
	}

	
	
}
