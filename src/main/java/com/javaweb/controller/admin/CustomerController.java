package com.javaweb.controller.admin;

import com.javaweb.entity.TransactionEntity;
import com.javaweb.enums.TransactionType;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.CustomerService;
import com.javaweb.service.TransactionService;
import com.javaweb.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@RestController
@Controller("customerControllerAdmin")
public class CustomerController {

    @Autowired
    private CustomerService customerService;
    @Autowired
    private UserService userService;
    @Autowired
    private TransactionService transactionService;

    @GetMapping("/admin/customer-list")
    public ModelAndView customerList(@ModelAttribute CustomerSearchRequest customerSearchRequest, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/customer/list");
        mav.addObject("modelSearch", customerSearchRequest);

        if(SecurityUtils.getAuthorities().contains("ROLE_STAFF")) {
            Long staffId = SecurityUtils.getPrincipal().getId();
            customerSearchRequest.setStaffId(staffId);
            mav.addObject("customerList", customerService.findAll(customerSearchRequest));
        }
        else{
            mav.addObject("customerList", customerService.findAll(customerSearchRequest));
        }

        mav.addObject("listStaffs", userService.getStaffs());
        mav.addObject("transactions", TransactionType.type());
        return mav;
    }

    @GetMapping("/admin/customer-edit")
    public ModelAndView customerEdit(@ModelAttribute("customerEdit") CustomerDTO customerDTO, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        return mav;
    }

    @GetMapping("/admin/customer-edit-{id}")
    public ModelAndView customerEdit(@PathVariable Long id, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        mav.addObject("transactionType", TransactionType.type());
        CustomerDTO customerEdit = customerService.findByCustomerId(id);
        mav.addObject("customerEdit", customerEdit);
        List<TransactionDTO> transactionCSHK = customerService.findTransactionsByTransactions_Code("CSKH", id);
        List<TransactionDTO> transactionDDX = customerService.findTransactionsByTransactions_Code("DDX", id);
        mav.addObject("transactionListCSKH", transactionCSHK);
        mav.addObject("transactionListDDX", transactionDDX);
        return mav;
    }

//    @GetMapping("/admin/customer/transaction-type")
//    public ModelAndView transactionType(@ModelAttribute("Transaction") TransactionDTO transactionDTO, HttpServletRequest request) {
//        ModelAndView mav = new ModelAndView("admin/customer/transaction-type");
//        return mav;
//    }
//
//    @GetMapping("/admin/customer/{id}/transaction-type")
//    public ModelAndView transactionType(@PathVariable Long id, HttpServletRequest request) {
//        ModelAndView mav = new ModelAndView("admin/customer/transaction-type");
//        TransactionDTO transactionDTO = transactionService.getTransactionById(id);
//        mav.addObject("transactionDTO", transactionDTO);
//        return mav;
//    }

}
