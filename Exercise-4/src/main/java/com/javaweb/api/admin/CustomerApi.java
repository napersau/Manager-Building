package com.javaweb.api.admin;


import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.CustomerService;
import com.javaweb.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "customerAPIOfAdmin")
@RequestMapping("/api/customer")
public class CustomerApi {

    @Autowired
    private CustomerService customerService;
    @Autowired
    private TransactionService transactionService;

    @PostMapping
    public CustomerDTO addOrUpdateCustomer(@RequestBody CustomerDTO customerDTO) {
        customerService.addOrUpdateCustomer(customerDTO);
        return customerDTO;
    }

    @DeleteMapping("/{ids}")
    public void deleteCustomer(@PathVariable List<Long> ids) {
        customerService.deleteByIdIn(ids);
    }

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id) {
        ResponseDTO result = customerService.listStaffs(id);
        return result;
    }

    @PostMapping("/assignment")
    public void assignCustomer(@RequestBody AssignmentCustomerDTO assignmentCustomerDTO) {
        customerService.addAssignmentCustomer(assignmentCustomerDTO);
    }

    @PostMapping("/transaction-type")
    public TransactionDTO addTransaction(@RequestBody TransactionDTO transactionDTO) {
        transactionService.addOrUpdateTransaction(transactionDTO);
        return transactionDTO;
    }

    @GetMapping("/{transactionId}/transaction-type")
    public TransactionDTO loadTransaction(@PathVariable Long transactionId) {
        return transactionService.getTransactionById(transactionId);
    }


}
