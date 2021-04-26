package vehicle_service.controller.v1.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import vehicle_service.controller.v1.mapper.AppDTOMapper;
import vehicle_service.controller.v1.request.AppRequest;
import vehicle_service.service.AppService;
import utility.annotations.ControllerV1;
import utility.constant.ActionType;
import utility.constant.EntityType;
import utility.constant.Messages;
import utility.custom_data_type.ValidList;
import utility.dto.ResponseDTO;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

@ControllerV1
public class VehicleMasterControllerV1 {

    @Autowired
    private AppService service;

    @GetMapping(path = "/vehicle")
    public ResponseEntity<String> greetUser( @NotNull @RequestParam String name) {
        return ResponseEntity.ok(service.greetService(name));
    }

    @PostMapping(path = "/vehicle")
    public ResponseEntity<ResponseDTO> addNewVehicle(@Valid @RequestBody AppRequest request) {
        service.saveUser(new AppDTOMapper().convertToDTO(request));
        return new ResponseEntity( ResponseDTO.setResponseDTO(
                Messages.setMessage(EntityType.USER, ActionType.CREATED, String.valueOf(request.getId()))),
                HttpStatus.CREATED
        );
    }

    @PutMapping(path = "/vehicle")
    public ResponseEntity<ResponseDTO> updateVehicle(@Valid @RequestBody AppRequest request) {
        service.saveUser(new AppDTOMapper().convertToDTO(request));
        return new ResponseEntity( ResponseDTO.setResponseDTO(
                Messages.setMessage(EntityType.USER, ActionType.CREATED, String.valueOf(request.getId()))),
                HttpStatus.CREATED
        );
    }

    @PutMapping(path = "/vehicle/disable")
    public ResponseEntity<ResponseDTO> disableVehicle(@Valid @RequestBody AppRequest request) {
        service.saveUser(new AppDTOMapper().convertToDTO(request));
        return new ResponseEntity( ResponseDTO.setResponseDTO(
                Messages.setMessage(EntityType.USER, ActionType.CREATED, String.valueOf(request.getId()))),
                HttpStatus.CREATED
        );
    }

    @DeleteMapping(path = "/vehicle")
    public ResponseEntity<ResponseDTO> deleteVehicle(@Valid @RequestBody AppRequest request) {
        service.saveUser(new AppDTOMapper().convertToDTO(request));
        return new ResponseEntity( ResponseDTO.setResponseDTO(
                Messages.setMessage(EntityType.USER, ActionType.CREATED, String.valueOf(request.getId()))),
                HttpStatus.CREATED
        );
    }
}
