package com.javaweb.service.impl;

import com.javaweb.controller.admin.TransactionConverter;
import com.javaweb.converter.CustomerConverter;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.xml.crypto.Data;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
@Transactional
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private CustomerConverter customerConverter;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private TransactionConverter transactionConverter;

    @Override
    public List<CustomerSearchResponse> findAll(CustomerSearchRequest customerSearchRequest) {
        List<CustomerSearchResponse> result = new ArrayList<>();
        List<CustomerEntity> customerEntities = customerRepository.findAll(customerSearchRequest);
        for(CustomerEntity it : customerEntities) {
            CustomerSearchResponse item = customerConverter.customerSearchResponse(it);
            result.add(item);
        }
        return result;
    }

    @Override
    public void addOrUpdateCustomer(CustomerDTO customerDTO) {
        CustomerEntity customerEntity = customerConverter.toCustomerEntity(customerDTO);
        customerEntity.setIsActive(1);
        if(customerDTO.getId() != null) {
            CustomerEntity oldCustomerEntity = customerRepository.findById(customerDTO.getId()).get();
            customerEntity.setCreatedBy(oldCustomerEntity.getCreatedBy());
            customerEntity.setCreatedDate(oldCustomerEntity.getCreatedDate());
            customerEntity.setUserEntities(oldCustomerEntity.getUserEntities());
            customerEntity.setTransactions(oldCustomerEntity.getTransactions());
        }
        customerRepository.save(customerEntity);
    }

    @Override
    public void deleteByIdIn(List<Long> ids) {
        customerRepository.deleteByIdIn(ids);
    }

    @Override
    public ResponseDTO listStaffs(Long customerId) {
        CustomerEntity customer = customerRepository.findById(customerId).get();
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        List<UserEntity> staffAssignment = customer.getUserEntities();
        ResponseDTO result = new ResponseDTO();
        List<StaffResponseDTO> staffResponseDTOList = new ArrayList<>();
        for(UserEntity it : staffs){
            StaffResponseDTO addStaff = new StaffResponseDTO();
            addStaff.setFullName(it.getFullName());
            addStaff.setStaffId(it.getId());
            if(staffAssignment.contains(it)){
                addStaff.setChecked("checked");
            }
            else{
                addStaff.setChecked("");
            }
            staffResponseDTOList.add(addStaff);
        }
        result.setMessage("success");
        result.setData(staffResponseDTOList);
        return result;
    }

    @Override
    public void addAssignmentCustomer(AssignmentCustomerDTO assignmentCustomerDTO) {
        CustomerEntity customerEntity = customerRepository.findById(assignmentCustomerDTO.getCustomerId()).get();
        List<UserEntity> staffs = userRepository.findByIdIn(assignmentCustomerDTO.getStaffs());
        customerEntity.setUserEntities(staffs);
        customerRepository.save(customerEntity);
    }

    @Override
    public CustomerDTO findByCustomerId(Long customerId) {
        CustomerEntity customerEntity = customerRepository.findById(customerId).get();
        CustomerDTO result = customerConverter.toCustomerDTO(customerEntity);
        return result;
    }

    @Override
    public List<TransactionDTO> findTransactionsByTransactions_Code(String code, Long customerId) {
        CustomerEntity customerEntity = customerRepository.findById(customerId).get();
        List<TransactionDTO> result = new ArrayList<>();
        List<TransactionEntity> transactionEntities = customerEntity.getTransactions();
        for(TransactionEntity it : transactionEntities){
            if(it.getCode().equals(code)){
                TransactionDTO transactionDTO = transactionConverter.totransactionDTO(it);
                result.add(transactionDTO);
            }
        }
        return result;
    }


}
