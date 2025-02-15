package com.javaweb.repository.custom.impl;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import com.javaweb.utils.NumberUtils;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.Collections;
import java.util.List;

@Repository
public class CustomerRepositoryImpl implements CustomerRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    public static void joinTable(CustomerSearchRequest customerSearchRequest, StringBuilder sql) {
        Long staffId = customerSearchRequest.getStaffId();
        if(staffId != null) {
            sql.append(" JOIN assignmentcustomer a ON a.customerid = c.id");
        }
    }

    public static void queryNormal(CustomerSearchRequest customerSearchRequest, StringBuilder where){
        try{
            Field[] fiels = CustomerSearchRequest.class.getDeclaredFields();

            for(Field item : fiels){
                item.setAccessible(true);
                String fieldName = item.getName();
                if(!fieldName.equals("staffId")){
                    Object value = item.get(customerSearchRequest);
                    if(value != null){
                        if(item.getType().getName().equals("java.lang.Long") || item.getType().getName().equals("java.lang.Integer")){
                            where.append(" AND c." + fieldName + " = " + value + " ");
                        }
                        else if(item.getType().getName().equals("java.lang.String") && !((String)value).isEmpty()){
                            where.append(" AND c." + fieldName + " LIKE '%" + value + "%' ");
                        }
                    }
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public static void querySpecial(CustomerSearchRequest customerSearchRequest, StringBuilder where){
        Long staffId = customerSearchRequest.getStaffId();
        if(staffId != null){
            where.append(" AND a.staffid = " + staffId + " ");

        }
        where.append(" AND c.is_active = 1 ");
    }

    @Override
    public List<CustomerEntity> findAll(CustomerSearchRequest customerSearchRequest) {
        StringBuilder sql = new StringBuilder("SELECT c.* FROM customer c ");
        joinTable(customerSearchRequest, sql);
        StringBuilder where = new StringBuilder(" WHERE 1 = 1 ");
        queryNormal(customerSearchRequest, where);
        querySpecial(customerSearchRequest, where);
        where.append(" ORDER BY c.id ");
        sql.append(where);
        Query query = entityManager.createNativeQuery(sql.toString(), CustomerEntity.class);
        return query.getResultList();
    }
}

