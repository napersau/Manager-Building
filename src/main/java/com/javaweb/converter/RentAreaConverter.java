package com.javaweb.converter;


import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Component
public class RentAreaConverter {
    @Autowired
    private ModelMapper modelMapper;

    public List<RentAreaEntity> toRentAreaEntity(BuildingDTO buildingDTO){
        List<RentAreaEntity> rentAreas = new ArrayList<>();
        String rentAreaCode[] = buildingDTO.getRentArea().trim().split(",");
        List<String> rentAreaCodeList = Arrays.asList(rentAreaCode);
        for(String item : rentAreaCodeList){
            RentAreaEntity rentAreaEntity = new RentAreaEntity();
            rentAreaEntity.setValue(item);
            rentAreas.add(rentAreaEntity);
        }
        return rentAreas;
    }
}
