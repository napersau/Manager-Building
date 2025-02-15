package com.javaweb.enums;

import org.springframework.security.core.parameters.P;

import java.util.Map;
import java.util.TreeMap;

public enum TransactionType {
    CSKH("Chăm sóc khách hàng"),
    DDX("Dẫn đi xem");

    private final String name;

    TransactionType(String name) {
        this.name = name;
    }

    public static Map<String, String> type(){
        Map<String, String> transactionTypes = new TreeMap<>();
        for (TransactionType it : TransactionType.values()) {
            transactionTypes.put(it.toString(), it.name);
        }
        return transactionTypes;
    }
}
