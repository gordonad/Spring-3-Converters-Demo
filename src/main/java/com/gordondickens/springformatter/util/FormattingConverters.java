package com.gordondickens.springformatter.util;

import org.springframework.format.FormatterRegistry;
import org.springframework.format.support.FormattingConversionServiceFactoryBean;

import com.gordondickens.springformatter.entity.SocialSecurityNumber;
import org.springframework.stereotype.Component;

@Component
public class FormattingConverters extends
		FormattingConversionServiceFactoryBean {

	@Override
	public void installFormatters(FormatterRegistry registry) {
		super.installFormatters(registry);
		registry.addFormatterForFieldType(SocialSecurityNumber.class, new SsnFormatter());
	}
}
