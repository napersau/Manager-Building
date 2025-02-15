package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.enums.buildingType;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.utils.DistrictCode;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;


@Component
public class BuildingConverter {

    @Autowired
    ModelMapper modelMapper;

    public BuildingSearchResponse toBuilding(BuildingEntity item){
        BuildingSearchResponse building = modelMapper.map(item, BuildingSearchResponse.class);
        String district = item.getDistrict();
        if(district != null && !district.isEmpty()){
            district = DistrictCode.valueOf(district).getDistrictName();
        }
        else{
            district = "null";
        }
        building.setAddress(item.getStreet() + ", " + item.getWard() + ", " + district);
        List<RentAreaEntity> rentAreas = item.getRentAreaEntities();
        String areaResult = rentAreas.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(", "));
        building.setRentArea(areaResult);
        return building;
    }

    public BuildingDTO toBuildingDTO(BuildingEntity item){
        BuildingDTO building = modelMapper.map(item, BuildingDTO.class);
        List<RentAreaEntity> rentAreas = item.getRentAreaEntities();
        String areaResult = rentAreas.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(", "));
        building.setRentArea(areaResult);
        String type[] = item.getType().split(",");
        List<String> typeCode = Arrays.asList(type);
        building.setTypeCode(typeCode);
        return building;
    }

    public BuildingEntity toBuildingEntity(BuildingDTO buildingDTO){
        BuildingEntity building = modelMapper.map(buildingDTO, BuildingEntity.class);
        String typeCode = building.getType().substring(1, building.getType().length() - 1);
        building.setType(typeCode);
        return building;
    }
}
