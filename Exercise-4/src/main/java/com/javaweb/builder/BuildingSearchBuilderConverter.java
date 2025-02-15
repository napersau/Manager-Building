package com.javaweb.builder;


import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.utils.MapUtils;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class BuildingSearchBuilderConverter {
    public BuildingSearchBuilder toBuildingSearchBuilder(BuildingSearchRequest buildingSearchRequest){
        BuildingSearchBuilder buildingSearchBuilder = new BuildingSearchBuilder.Builder()
                                .setName(MapUtils.getObject(buildingSearchRequest.getName(), String.class))
                                .setFloorArea(MapUtils.getObject(buildingSearchRequest.getFloorArea(), Long.class))
                                .setWard(MapUtils.getObject(buildingSearchRequest.getWard(), String.class))
                                .setStreet(MapUtils.getObject(buildingSearchRequest.getStreet(), String.class))
                                .setDistrict(MapUtils.getObject(buildingSearchRequest.getDistrict(), String.class))
                                .setNumberOfBasement(MapUtils.getObject(buildingSearchRequest.getNumberOfBasement(), Integer.class))
                                .setTypeCode(buildingSearchRequest.getTypeCode())
                                .setManagerName(MapUtils.getObject(buildingSearchRequest.getManagerName(), String.class))
                                .setManagerPhone(MapUtils.getObject(buildingSearchRequest.getManagerPhone(), String.class))
                                .setRentPriceFrom(MapUtils.getObject(buildingSearchRequest.getRentPriceFrom(), Long.class))
                                .setRentPriceTo(MapUtils.getObject(buildingSearchRequest.getRentPriceTo(), Long.class))
                                .setAreaFrom(MapUtils.getObject(buildingSearchRequest.getAreaFrom(), Long.class))
                                .setAreaTo(MapUtils.getObject(buildingSearchRequest.getAreaTo(), Long.class))
                                .setStaffId(MapUtils.getObject(buildingSearchRequest.getStaffId(), Long.class))
                                .setDirection(MapUtils.getObject(buildingSearchRequest.getDirection(), String.class))
                                .setLevel(MapUtils.getObject(buildingSearchRequest.getLevel(), String.class))
                                .build();
        return buildingSearchBuilder;
    }
}
