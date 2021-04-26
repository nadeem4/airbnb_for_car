package vehicle_service.controller.v1.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import utility.annotations.ControllerV1;
import utility.constant.ActionType;
import utility.constant.EntityType;
import utility.constant.Messages;
import utility.dto.ResponseDTO;
import vehicle_service.controller.v1.mapper.AppDTOMapper;
import vehicle_service.controller.v1.request.AppRequest;
import vehicle_service.service.AppService;

import javax.validation.Valid;

@ControllerV1
public class VehicleServiceControllerV1 {


    @Autowired
    private AppService service;

    @GetMapping(path = "/vehicle/service-record")
    public ResponseEntity<ResponseDTO> getVehicleServiceRecord(@Valid @RequestBody AppRequest request) {
        service.saveUser(new AppDTOMapper().convertToDTO(request));
        return new ResponseEntity( ResponseDTO.setResponseDTO(
                Messages.setMessage(EntityType.USER, ActionType.CREATED, String.valueOf(request.getId()))),
                HttpStatus.CREATED
        );
    }

    @GetMapping(path = "/vehicle/service-records")
    public ResponseEntity<ResponseDTO> getVehicleServiceRecords(@Valid @RequestBody AppRequest request) {
        service.saveUser(new AppDTOMapper().convertToDTO(request));
        return new ResponseEntity( ResponseDTO.setResponseDTO(
                Messages.setMessage(EntityType.USER, ActionType.CREATED, String.valueOf(request.getId()))),
                HttpStatus.CREATED
        );
    }

    @PostMapping(path = "/vehicle/service-record")
    public ResponseEntity<ResponseDTO> addNewVehicleServiceRecord(@Valid @RequestBody AppRequest request) {
        service.saveUser(new AppDTOMapper().convertToDTO(request));
        return new ResponseEntity( ResponseDTO.setResponseDTO(
                Messages.setMessage(EntityType.USER, ActionType.CREATED, String.valueOf(request.getId()))),
                HttpStatus.CREATED
        );
    }

    @PutMapping(path = "/vehicle/service-record")
    public ResponseEntity<ResponseDTO> updateVehicleServiceRecord(@Valid @RequestBody AppRequest request) {
        service.saveUser(new AppDTOMapper().convertToDTO(request));
        return new ResponseEntity( ResponseDTO.setResponseDTO(
                Messages.setMessage(EntityType.USER, ActionType.CREATED, String.valueOf(request.getId()))),
                HttpStatus.CREATED
        );
    }

    @DeleteMapping(path = "/vehicle/service")
    public ResponseEntity<ResponseDTO> deleteVehicleServiceRecord(@Valid @RequestBody AppRequest request) {
        service.saveUser(new AppDTOMapper().convertToDTO(request));
        return new ResponseEntity( ResponseDTO.setResponseDTO(
                Messages.setMessage(EntityType.USER, ActionType.CREATED, String.valueOf(request.getId()))),
                HttpStatus.CREATED
        );
    }
}
