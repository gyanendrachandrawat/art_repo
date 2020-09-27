package com.art_project.user;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table (name = "user")
@Data
@Builder(toBuilder = true)
@NoArgsConstructor(access = AccessLevel.PACKAGE)
@AllArgsConstructor(access = AccessLevel.PACKAGE)
public class UserModel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int id;

	@Column
	private String name;

	@Column(unique = true)
	private String mobile;

	@Column
	private String dob;

	@Column
	private String zip;

	@Column
	private String password;

	@Column
	private String soicalMediaAccounts;

	@Column
	private String hrsOnline;

	@Column
	private String onlineFor;

	@Column
	private Boolean isBusinessInternetBased;

	@Column
	private Boolean isInternetInfluencer;

	@Column
	private String paymentDone;

	@Column
	private Integer points;

	@Column
	private Integer level;

	@Column
	private String link;

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", mobile=" + mobile + ", dob=" + dob + ", zip=" + zip
				+ ", password=" + password + ", soicalMediaAcconts=" + soicalMediaAccounts + ", hoursOnline="
				+ hrsOnline + ", onlineFor=" + onlineFor + ", isBusinessInternetBased=" + isBusinessInternetBased
				+ ", isInternetInfluencer=" + isInternetInfluencer + ", paymentDone=" + paymentDone + ", points="
				+ points + ", level=" + level + ",link=" + link + "]";
	}
}
