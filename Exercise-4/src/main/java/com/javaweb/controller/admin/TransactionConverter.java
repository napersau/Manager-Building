package com.javaweb.controller.admin;


import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TransactionConverter {
    @Autowired
    ModelMapper modelMapper;

    public TransactionDTO totransactionDTO(TransactionEntity transactionEntity){
        TransactionDTO transactionDTO = modelMapper.map(transactionEntity, TransactionDTO.class);
        return transactionDTO;
    }

    public TransactionEntity toTransactionEntity(TransactionDTO transactionDTO){
        TransactionEntity transactionEntity = modelMapper.map(transactionDTO, TransactionEntity.class);
        return transactionEntity;
    }
}
