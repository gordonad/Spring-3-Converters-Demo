package com.gordondickens.springformatter.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gordondickens.springformatter.entity.Employee;

@RooWebScaffold(path = "employees", formBackingObject = Employee.class)
@RequestMapping("/employees")
@Controller
public class EmployeeController {
}
