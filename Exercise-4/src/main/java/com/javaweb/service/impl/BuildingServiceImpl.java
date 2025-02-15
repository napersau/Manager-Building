package com.javaweb.service.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.builder.BuildingSearchBuilderConverter;
import com.javaweb.converter.BuildingConverter;
import com.javaweb.converter.RentAreaConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class BuildingServiceImpl implements BuildingService {


    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BuildingSearchBuilderConverter buildingSearchBuilderConverter;
    @Autowired
    private BuildingConverter buildingConverter;
    @Autowired
    private RentAreaConverter rentAreaConverter;
    @Autowired
    private RentAreaRepository rentAreaRepository;
    @Autowired
    private BuildingService buildingService;

    @Override
    public ResponseDTO listStaffs(Long buildingId) {
        BuildingEntity building = buildingRepository.findById(buildingId).get();
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1,"STAFF");
        List<UserEntity> staffAssignment = building.getUserEntities();
        List<StaffResponseDTO> staffResponseDTOS = new ArrayList<>();
        ResponseDTO responseDTO = new ResponseDTO();
        for(UserEntity it : staffs){
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setFullName(it.getFullName());
            staffResponseDTO.setStaffId(it.getId());
            if(staffAssignment.contains(it)){
                staffResponseDTO.setChecked("checked");
            }
            else{
                staffResponseDTO.setChecked("");
            }
            staffResponseDTOS.add(staffResponseDTO);
        }
        responseDTO.setData(staffResponseDTOS);
        responseDTO.setMessage("success");
        return responseDTO;
    }

    @Override
    public List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest) {
        BuildingSearchBuilder buildingSearchBuilder = buildingSearchBuilderConverter.toBuildingSearchBuilder(buildingSearchRequest);
        List<BuildingEntity> buildingEntities = buildingRepository.findAll(buildingSearchBuilder);
        List<BuildingSearchResponse> result = new ArrayList<>();
        for(BuildingEntity item  : buildingEntities){
            BuildingSearchResponse building = buildingConverter.toBuilding(item);
            result.add(building);
        }
        return result;
    }

    @Override
    public BuildingDTO findBuildingById(Long buildingId) {
        BuildingEntity building = buildingRepository.findById(buildingId).get();
        BuildingDTO buildingDTO = buildingConverter.toBuildingDTO(building);
        return buildingDTO;
    }

    @Override
    public BuildingDTO addOrUpdateBuilding(BuildingDTO buildingDTO) {
        Long buildingId = buildingDTO.getId();
        BuildingEntity building = buildingConverter.toBuildingEntity(buildingDTO);
        if(buildingId == null){
            buildingRepository.save(building);
            List<RentAreaEntity> rentArea = rentAreaConverter.toRentAreaEntity(buildingDTO);
            for(RentAreaEntity rentAreaEntity : rentArea){
                rentAreaEntity.setBuilding(building);
            }
            rentAreaRepository.saveAll(rentArea);
        }
        else{
            buildingRepository.save(building);
            List<RentAreaEntity> rentArea = rentAreaConverter.toRentAreaEntity(buildingDTO);
            for(RentAreaEntity rentAreaEntity : rentArea){
                rentAreaEntity.setBuilding(building);
            }
            rentAreaRepository.saveAll(rentArea);
        }
        return null;
    }

    @Override
    public void deleteByIdIn(List<Long> ids) {
        buildingService.deleteByIdIn(ids);
    }

    @Override
    public AssignmentBuildingDTO addAssignmentBuildingEntity(AssignmentBuildingDTO assignmentBuildingDTO) {
        BuildingEntity buildingEntity = buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get();
        List<UserEntity> userEntities = userRepository.findByIdIn(assignmentBuildingDTO.getStaffs());
        buildingEntity.setUserEntities(userEntities);
        buildingRepository.save(buildingEntity);
        return assignmentBuildingDTO;
    }

}