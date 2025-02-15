package com.javaweb.service.impl;

import com.javaweb.controller.admin.TransactionConverter;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class TransactionServiceImpl implements TransactionService {

    @Autowired
    private TransactionConverter transactionConverter;
    @Autowired
    private TransactionRepository transactionRepository;
    @Autowired
    private CustomerRepository customerRepository;

    @Override
    public void addOrUpdateTransaction(TransactionDTO transactionDTO) {
        TransactionEntity transactionEntity = transactionConverter.toTransactionEntity(transactionDTO);
        CustomerEntity customerEntity = customerRepository.findById(transactionDTO.getCustomerId()).get();
        transactionEntity.setCustomer(customerEntity);
        if(transactionDTO.getId() != null) {
            TransactionEntity oldTransactionEntity = transactionRepository.findById(transactionDTO.getId()).get();
            transactionEntity.setCreatedDate(oldTransactionEntity.getCreatedDate());
            transactionEntity.setCreatedBy(oldTransactionEntity.getCreatedBy());
        }
        transactionRepository.save(transactionEntity);
    }

    @Override
    public TransactionDTO getTransactionById(Long id) {
        TransactionEntity transaction = transactionRepository.findById(id).get();
        TransactionDTO result = transactionConverter.totransactionDTO(transaction);
        return result;
    }
}
