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
public class VehicleRentControllerV1 {

    @Autowired
    private AppService service;

    @GetMapping(path = "/vehicle/rent-contract")
    public ResponseEntity<ResponseDTO> getVehicleRentContract(@Valid @RequestBody AppRequest request) {
        service.saveUser(new AppDTOMapper().convertToDTO(request));
        return new ResponseEntity( ResponseDTO.setResponseDTO(
                Messages.setMessage(EntityType.USER, ActionType.CREATED, String.valueOf(request.getId()))),
                HttpStatus.CREATED
        );
    }

    @GetMapping(path = "/vehicle/rent-contracts")
    public ResponseEntity<ResponseDTO> getVehicleRentContracts(@Valid @RequestBody AppRequest request) {
        service.saveUser(new AppDTOMapper().convertToDTO(request));
        return new ResponseEntity( ResponseDTO.setResponseDTO(
                Messages.setMessage(EntityType.USER, ActionType.CREATED, String.valueOf(request.getId()))),
                HttpStatus.CREATED
        );
    }

    @PostMapping(path = "/vehicle/rent-contract")
    public ResponseEntity<ResponseDTO> createVehicleRentContract(@Valid @RequestBody AppRequest request) {
        service.saveUser(new AppDTOMapper().convertToDTO(request));
        return new ResponseEntity( ResponseDTO.setResponseDTO(
                Messages.setMessage(EntityType.USER, ActionType.CREATED, String.valueOf(request.getId()))),
                HttpStatus.CREATED
        );
    }

    @PutMapping(path = "/vehicle/rent-contract")
    public ResponseEntity<ResponseDTO> updateVehicleRentContract(@Valid @RequestBody AppRequest request) {
        service.saveUser(new AppDTOMapper().convertToDTO(request));
        return new ResponseEntity( ResponseDTO.setResponseDTO(
                Messages.setMessage(EntityType.USER, ActionType.CREATED, String.valueOf(request.getId()))),
                HttpStatus.CREATED
        );
    }

    @DeleteMapping(path = "/vehicle/rent-contract")
    public ResponseEntity<ResponseDTO> deleteVehicleRentContract(@Valid @RequestBody AppRequest request) {
        service.saveUser(new AppDTOMapper().convertToDTO(request));
        return new ResponseEntity( ResponseDTO.setResponseDTO(
                Messages.setMessage(EntityType.USER, ActionType.CREATED, String.valueOf(request.getId()))),
                HttpStatus.CREATED
        );
    }
}
