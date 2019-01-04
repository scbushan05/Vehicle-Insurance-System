package in.bushansirgur.vis.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_insurance")
public class InsuranceModel{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private Integer id;
	@Column
	private String provider;
	@Column(name = "insurance_number")
	private String insuranceNumber;
	@Column(name = "valid_date")
	private String insuranceValidDate;
	
	@OneToOne
	@JoinColumn(name = "user_id")
	private UserModel user;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public InsuranceModel(){}

	public InsuranceModel(String provider, 
					 String insuranceNumber, 
					 String insuranceValidDate) 
	{
		super();
		this.provider = provider;
		this.insuranceNumber = insuranceNumber;
		this.insuranceValidDate = insuranceValidDate;
	}

	public String getProvider() {
		return provider;
	}

	public void setProvider(String provider) {
		this.provider = provider;
	}

	public String getInsuranceNumber() {
		return insuranceNumber;
	}

	public void setInsuranceNumber(String insuranceNumber) {
		this.insuranceNumber = insuranceNumber;
	}

	public String getInsuranceValidDate() {
		return insuranceValidDate;
	}

	public void setInsuranceValidDate(String insuranceValidDate) {
		this.insuranceValidDate = insuranceValidDate;
	}

	public UserModel getUser() {
		return user;
	}

	public void setUser(UserModel user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "InsuranceModel [id=" + id + ", provider=" + provider + ", insuranceNumber=" + insuranceNumber
				+ ", insuranceValidDate=" + insuranceValidDate + ", user=" + user + "]";
	}
	
	
}
