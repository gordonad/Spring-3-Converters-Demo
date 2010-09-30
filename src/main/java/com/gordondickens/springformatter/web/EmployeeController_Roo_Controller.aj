// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.gordondickens.springformatter.web;

import com.gordondickens.springformatter.entity.Employee;
import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import org.springframework.core.convert.converter.Converter;
import org.springframework.core.convert.support.GenericConversionService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

privileged aspect EmployeeController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String EmployeeController.create(@Valid Employee employee, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("employee", employee);
            return "employees/create";
        }
        employee.persist();
        return "redirect:/employees/" + employee.getId();
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String EmployeeController.createForm(Model model) {
        model.addAttribute("employee", new Employee());
        return "employees/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String EmployeeController.show(@PathVariable("id") Long id, Model model) {
        model.addAttribute("employee", Employee.findEmployee(id));
        model.addAttribute("itemId", id);
        return "employees/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String EmployeeController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            model.addAttribute("employees", Employee.findEmployeeEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Employee.countEmployees() / sizeNo;
            model.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            model.addAttribute("employees", Employee.findAllEmployees());
        }
        return "employees/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String EmployeeController.update(@Valid Employee employee, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("employee", employee);
            return "employees/update";
        }
        employee.merge();
        return "redirect:/employees/" + employee.getId();
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String EmployeeController.updateForm(@PathVariable("id") Long id, Model model) {
        model.addAttribute("employee", Employee.findEmployee(id));
        return "employees/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String EmployeeController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        Employee.findEmployee(id).remove();
        model.addAttribute("page", (page == null) ? "1" : page.toString());
        model.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/employees?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
    Converter<Employee, String> EmployeeController.getEmployeeConverter() {
        return new Converter<Employee, String>() {
            public String convert(Employee employee) {
                return new StringBuilder().append(employee.getFirstName()).append(" ").append(employee.getLastName()).append(" ").append(employee.getHireDate()).toString();
            }
        };
    }
    
    @InitBinder
    void EmployeeController.registerConverters(WebDataBinder binder) {
        if (binder.getConversionService() instanceof GenericConversionService) {
            GenericConversionService conversionService = (GenericConversionService) binder.getConversionService();
            conversionService.addConverter(getEmployeeConverter());
        }
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public String EmployeeController.showJson(@PathVariable("id") Long id) {
        return Employee.findEmployee(id).toJson();
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> EmployeeController.createFromJson(@RequestBody String json) {
        Employee.fromJsonToEmployee(json).persist();
        return new ResponseEntity<String>("Employee created", HttpStatus.CREATED);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public String EmployeeController.listJson() {
        return Employee.toJsonArray(Employee.findAllEmployees());
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> EmployeeController.createFromJsonArray(@RequestBody String json) {
        for (Employee employee: Employee.fromJsonArrayToEmployees(json)) {
            employee.persist();
        }
        return new ResponseEntity<String>("Employee created", HttpStatus.CREATED);
    }
    
}
