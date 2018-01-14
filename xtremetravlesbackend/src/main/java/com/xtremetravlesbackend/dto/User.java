package com.xtremetravlesbackend.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

@Entity
public class User {

		

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String addCode;
	private String panCode;
	@Column(name = "first_name")
	private String firstName;
	@Column(name = "last_name")
	private String lastName;
	private String email;
	@Column(name = "contact_number")
	private String contactNumber;
	private String role;
	private String password;
	private boolean active = true;
	@Transient
	private String confirmPassword;
	@Column(name = "address_line_one")
	private String addressLineOne;
	@Column(name = "address_line_two")
	private String addressLineTwo;
	private String city;
	private String state;
	private String country;
	@Column(name ="postal_code")
	private String postalCode;
	@Column(name ="company_name")
	private String companyName;
	@Column(name ="address_proof_type")
	private String addressProofType;
	
	@Transient
	private MultipartFile addressProof;
	
	@Column(name ="pan_number")
	private String panNumber;
	
	@Column(name ="monthly_sales_volume")
	private String monthlySalesVolume;
	
	@Column(name ="pan_holder_name")
	private String panHolderName;
	
	@Transient
	private MultipartFile panCardProof;
	
	@Column(name ="deposit_type")
	private String depositType;
	
	@Column(name ="depositAmount")
	private String depositAmount;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	
	public String getAddCode() {
		return getId()+"ADDRESSPRF";
	}

	public void setAddCode(String addCode) {
		this.addCode = addCode;
	}

	public String getPanCode() {
	  return getId()+"PANPRF";
	}

	public void setPanCode(String panCode) {
		this.panCode = panCode;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	
	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public String getAddressLineOne() {
		return addressLineOne;
	}

	public void setAddressLineOne(String addressLineOne) {
		this.addressLineOne = addressLineOne;
	}

	public String getAddressLineTwo() {
		return addressLineTwo;
	}

	public void setAddressLineTwo(String addressLineTwo) {
		this.addressLineTwo = addressLineTwo;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getAddressProofType() {
		return addressProofType;
	}

	public void setAddressProofType(String addressProofType) {
		this.addressProofType = addressProofType;
	}

	public MultipartFile getAddressProof() {
		return addressProof;
	}

	public void setAddressProof(MultipartFile addressProof) {
		this.addressProof = addressProof;
	}

	public String getPanNumber() {
		return panNumber;
	}

	public void setPanNumber(String panNumber) {
		this.panNumber = panNumber;
	}

	public String getMonthlySalesVolume() {
		return monthlySalesVolume;
	}

	public void setMonthlySalesVolume(String monthlySalesVolume) {
		this.monthlySalesVolume = monthlySalesVolume;
	}

	public String getPanHolderName() {
		return panHolderName;
	}

	public void setPanHolderName(String panHolderName) {
		this.panHolderName = panHolderName;
	}

	public MultipartFile getPanCardProof() {
		return panCardProof;
	}

	public void setPanCardProof(MultipartFile panCardProof) {
		this.panCardProof = panCardProof;
	}

	public String getDepositType() {
		return depositType;
	}

	public void setDepositType(String depositType) {
		this.depositType = depositType;
	}

	public String getDepositAmount() {
		return depositAmount;
	}

	public void setDepositAmount(String depositAmount) {
		this.depositAmount = depositAmount;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", addCode=" + addCode + ", panCode=" + panCode + ", firstName=" + firstName
				+ ", lastName=" + lastName + ", email=" + email + ", contactNumber=" + contactNumber + ", role=" + role
				+ ", password=" + password + ", active=" + active + ", confirmPassword=" + confirmPassword
				+ ", addressLineOne=" + addressLineOne + ", addressLineTwo=" + addressLineTwo + ", city=" + city
				+ ", state=" + state + ", country=" + country + ", postalCode=" + postalCode + ", companyName="
				+ companyName + ", addressProofType=" + addressProofType + ", addressProof=" + addressProof
				+ ", panNumber=" + panNumber + ", monthlySalesVolume=" + monthlySalesVolume + ", panHolderName="
				+ panHolderName + ", panCardProof=" + panCardProof + ", depositType=" + depositType + ", depositAmount="
				+ depositAmount + "]";
	}

	
	
	
	
	
	
	
	
}
	