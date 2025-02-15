package com.javaweb.model.dto;

import java.util.List;

public class AssignmentCustomerDTO {
    private Long customerId;
    private List<Long> staffs;

    public List<Long> getStaffs() {
        return staffs;
    }

    public void setStaffs(List<Long> staffs) {
        this.staffs = staffs;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }
}
