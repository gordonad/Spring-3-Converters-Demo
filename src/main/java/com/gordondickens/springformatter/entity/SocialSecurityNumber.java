package com.gordondickens.springformatter.entity;

import javax.persistence.Embeddable;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@Embeddable
public class SocialSecurityNumber {

	private String prefix;

	private String middle;

	private String suffix;

}
