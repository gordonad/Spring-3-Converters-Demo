package com.gordondickens.springformatter.entity;

import java.math.BigDecimal;

import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.Type;
import org.joda.time.DateTime;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@Entity
@RooJavaBean
@RooToString
@RooEntity
public class Employee {

	@NotNull
	private String firstName;

	@NotNull
	private String lastName;

	@NotNull
	@Type(type = "org.joda.time.contrib.hibernate.PersistentDateTime")
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private DateTime hireDate;

	@NotNull
	private BigDecimal salary;

	@Embedded
	private SocialSecurityNumber socialSecurityNumber;
}
