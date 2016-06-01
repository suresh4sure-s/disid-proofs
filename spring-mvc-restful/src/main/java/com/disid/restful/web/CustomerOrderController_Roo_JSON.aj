// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.disid.restful.web;

import com.disid.restful.model.CustomerOrder;
import com.disid.restful.web.CustomerOrderController;
import java.lang.SuppressWarnings;
import java.net.URI;
import java.util.Collection;
import java.util.List;
import javax.validation.Valid;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

privileged aspect CustomerOrderController_Roo_JSON {
    
    @RequestMapping(method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public ResponseEntity CustomerOrderController.create(@Valid @RequestBody CustomerOrder customerOrder, BindingResult result) {
        
        if (customerOrder.getId() != null) {
            return new ResponseEntity(HttpStatus.CONFLICT);
        }
        
        if (result.hasErrors()) {
            return new ResponseEntity(result, HttpStatus.CONFLICT);
        }
        
        CustomerOrder newCustomerOrder = customerOrderService.save(customerOrder);
        HttpHeaders responseHeaders = populateHeaders(newCustomerOrder.getId());
        
        return new ResponseEntity(newCustomerOrder, responseHeaders, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/{customerOrder}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public ResponseEntity CustomerOrderController.update(@Valid @RequestBody CustomerOrder customerOrder, BindingResult result) {
        
        if (result.hasErrors()) {
            return new ResponseEntity(result, HttpStatus.CONFLICT);
        }
        
        CustomerOrder savedCustomerOrder = customerOrderService.save(customerOrder);
        
        return new ResponseEntity(savedCustomerOrder, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/batch", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public ResponseEntity CustomerOrderController.createBatch(@Valid @RequestBody Collection<CustomerOrder> customerOrders, BindingResult result) {
        
        if (result.hasErrors()) {
            return new ResponseEntity(result, HttpStatus.CONFLICT);
        }
        
        List<CustomerOrder> newCustomerOrders = customerOrderService.save(customerOrders);
        
        return new ResponseEntity(newCustomerOrders, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/batch", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public ResponseEntity CustomerOrderController.updateBatch(@Valid @RequestBody Collection<CustomerOrder> customerOrders, BindingResult result) {
        
        if (result.hasErrors()) {
            return new ResponseEntity(result, HttpStatus.CONFLICT);
        }
        
        List<CustomerOrder> savedCustomerOrders = customerOrderService.save(customerOrders);
        
        return new ResponseEntity(savedCustomerOrders, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/batch/{ids}", method = RequestMethod.DELETE, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    @SuppressWarnings({ "rawtypes" })
    public ResponseEntity CustomerOrderController.deleteBatch(@PathVariable("ids") Collection<Long> ids) {
        
        customerOrderService.delete(ids);
        
        return new ResponseEntity(HttpStatus.OK);
    }
    
    public HttpHeaders CustomerOrderController.populateHeaders(Long id) {
        UriComponents uriComponents = UriComponentsBuilder.fromUriString("/customerorders/{id}").build();
        URI uri = uriComponents.expand(id).encode().toUri();
        
        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.setLocation(uri);
        return responseHeaders;
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public ResponseEntity CustomerOrderController.show(@PathVariable("id") Long id) {
        
        CustomerOrder customerOrder = customerOrderService.findOne(id);
        
        if (customerOrder == null) {
            return new ResponseEntity(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity(customerOrder, HttpStatus.FOUND);
    }
    
}