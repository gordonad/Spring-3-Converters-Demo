package com.gordondickens.springformatter.util;

import java.text.ParseException;
import java.util.Locale;

import org.apache.commons.lang.StringUtils;
import org.springframework.format.Formatter;

import com.gordondickens.springformatter.entity.SocialSecurityNumber;


public class SsnFormatter implements Formatter<SocialSecurityNumber> {

	@Override
	public String print(SocialSecurityNumber object, Locale locale) {
		return object.toString();
	}

	@Override
	public SocialSecurityNumber parse(String text, Locale locale)
			throws ParseException {
		SocialSecurityNumber securityNumber = new SocialSecurityNumber();
		securityNumber.setPrefix(StringUtils.substringBefore(text, "-"));
		securityNumber.setMiddle(StringUtils.substringBetween(text, "-"));
		securityNumber.setSuffix(StringUtils.substringAfterLast(text, "-"));

		return securityNumber;
	}

}
