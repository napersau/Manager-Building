package com.javaweb.builder;

import java.util.ArrayList;
import java.util.List;


public class BuildingSearchBuilder {
    private String name;
    private Long floorArea;
    private String ward;
    private String street;
    private String district;
    private Integer numberOfBasement;
    private List<String> typeCode = new ArrayList<>();
    private String managerName;
    private String managerPhone;
    private Long rentPriceFrom;
    private Long rentPriceTo;
    private Long areaFrom;
    private Long areaTo;
    private Long staffId;
    private String direction;
    private String level;

    private BuildingSearchBuilder(Builder builder) {
        this.name = builder.name;
        this.floorArea = builder.floorArea;
        this.ward = builder.ward;
        this.street = builder.street;
        this.district = builder.district;
        this.numberOfBasement = builder.numberOfBasement;
        this.typeCode = builder.typeCode;
        this.managerName = builder.managerName;
        this.managerPhone = builder.managerPhone;
        this.rentPriceFrom = builder.rentPriceFrom;
        this.rentPriceTo = builder.rentPriceTo;
        this.areaFrom = builder.areaFrom;
        this.areaTo = builder.areaTo;
        this.staffId = builder.staffId;
        this.direction = builder.direction;
        this.level = builder.level;
    }

    public String getLevel() {
        return level;
    }

    public String getDirection() {
        return direction;
    }

    public String getName() {
        return name;
    }
    public Long getFloorArea() {
        return floorArea;
    }
    public String getWard() {
        return ward;
    }
    public String getStreet() {
        return street;
    }
    public String getDistrict() {
        return district;
    }
    public Integer getNumberOfBasement() {
        return numberOfBasement;
    }
    public List<String> getTypeCode() {
        return typeCode;
    }
    public String getManagerName() {
        return managerName;
    }
    public String getManagerPhone() {
        return managerPhone;
    }
    public Long getRentPriceFrom() {
        return rentPriceFrom;
    }
    public Long getRentPriceTo() {
        return rentPriceTo;
    }
    public Long getAreaFrom() {
        return areaFrom;
    }
    public Long getAreaTo() {
        return areaTo;
    }
    public Long getStaffId() {
        return staffId;
    }


    public static class Builder{
        private String name;
        private Long floorArea;
        private String ward;
        private String street;
        private String district;
        private Integer numberOfBasement;
        private List<String> typeCode = new ArrayList<>();
        private String managerName;
        private String managerPhone;
        private Long rentPriceFrom;
        private Long rentPriceTo;
        private Long areaFrom;
        private Long areaTo;
        private Long staffId;
        private String direction;
        private String level;

        public Builder setLevel(String level) {
            this.level = level;
            return this;
        }


        public Builder setDirection(String direction) {
            this.direction = direction;
            return this;
        }

        public Builder setName(String name) {
            this.name = name;
            return this;
        }
        public Builder setFloorArea(Long floorArea) {
            this.floorArea = floorArea;
            return this;
        }
        public Builder setWard(String ward) {
            this.ward = ward;
            return this;
        }
        public Builder setStreet(String street) {
            this.street = street;
            return this;
        }
        public Builder setDistrict(String district) {
            this.district = district;
            return this;
        }
        public Builder setNumberOfBasement(Integer numberOfBasement) {
            this.numberOfBasement = numberOfBasement;
            return this;
        }
        public Builder setTypeCode(List<String> typeCode) {
            this.typeCode = typeCode;
            return this;
        }
        public Builder setManagerName(String managerName) {
            this.managerName = managerName;
            return this;
        }
        public Builder setManagerPhone(String managerPhone) {
            this.managerPhone = managerPhone;
            return this;
        }
        public Builder setRentPriceFrom(Long rentPriceFrom) {
            this.rentPriceFrom = rentPriceFrom;
            return this;
        }
        public Builder setRentPriceTo(Long rentPriceTo) {
            this.rentPriceTo = rentPriceTo;
            return this;
        }
        public Builder setAreaFrom(Long areaFrom) {
            this.areaFrom = areaFrom;
            return this;
        }
        public Builder setAreaTo(Long areaTo) {
            this.areaTo = areaTo;
            return this;
        }
        public Builder setStaffId(Long staffId) {
            this.staffId = staffId;
            return this;
        }

        public BuildingSearchBuilder build() {
            return new BuildingSearchBuilder(this);
        }
    }
}
