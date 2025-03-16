package com.javaweb.enums;


import java.util.*;

public enum  buildingType {
    TANG_TRET ("Tầng Trệt "),
    NGUYEN_CAN ("Nguyên Căn "),
    NOI_THAT ("Nội Thất ");

    private final String name;

    buildingType(String name) {
        this.name = name;
    }

    public String getCode() {
        return name;
    }

    public static Map<String,String> type(){
        Map<String,String> listType = new HashMap<>();
        for(buildingType item : buildingType.values()){
            listType.put(item.toString() , item.name);
        }
        return listType;
    }
}
