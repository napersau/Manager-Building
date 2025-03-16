package com.javaweb.service;

import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.ResponseDTO;

import java.util.List;

public interface CustomerService {
    List<CustomerSearchResponse> findAll(CustomerSearchRequest customerSearchRequest);
    void addOrUpdateCustomer(CustomerDTO customerDTO);
    void deleteByIdIn(List<Long> ids);
    ResponseDTO listStaffs(Long customerId);
    void addAssignmentCustomer(AssignmentCustomerDTO assignmentCustomerDTO);
    CustomerDTO findByCustomerId(Long customerId);
    List<TransactionDTO> findTransactionsByTransactions_Code(String code, Long customerId);

}
