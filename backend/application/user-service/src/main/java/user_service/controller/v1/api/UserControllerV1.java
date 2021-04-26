package user_service.controller.v1.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import utility.annotations.ControllerV1;
import utility.constant.ActionType;
import utility.constant.EntityType;
import utility.constant.Messages;
import utility.dto.ResponseDTO;
import user_service.controller.v1.mapper.AppDTOMapper;
import user_service.controller.v1.request.AppRequest;
import user_service.service.AppService;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

@ControllerV1
public class UserControllerV1 {

    @Autowired
    private AppService service;

    @GetMapping(path = "/user/detail")
    public ResponseEntity<String> getUserDetail( @NotNull @RequestParam String name) {
        return ResponseEntity.ok(service.greetService(name));
    }

    @PostMapping(path = "/user/signup")
    public ResponseEntity<ResponseDTO> userSignup(@Valid @RequestBody AppRequest request) {
        service.saveUser(new AppDTOMapper().convertToDTO(request));
        return new ResponseEntity( ResponseDTO.setResponseDTO(
                Messages.setMessage(EntityType.USER, ActionType.CREATED, String.valueOf(request.getId()))),
                HttpStatus.CREATED
        );
    }

    @PostMapping(path = "/user/sign-in")
    public ResponseEntity<ResponseDTO> userSignIn(@Valid @RequestBody AppRequest request) {
        service.saveUser(new AppDTOMapper().convertToDTO(request));
        return new ResponseEntity( ResponseDTO.setResponseDTO(
                Messages.setMessage(EntityType.USER, ActionType.CREATED, String.valueOf(request.getId()))),
                HttpStatus.CREATED
        );
    }

    @PostMapping(path = "/user/access-history")
    public ResponseEntity<ResponseDTO> saveUserAppAccessHistory(@Valid @RequestBody AppRequest request) {
        service.saveUser(new AppDTOMapper().convertToDTO(request));
        return new ResponseEntity( ResponseDTO.setResponseDTO(
                Messages.setMessage(EntityType.USER, ActionType.CREATED, String.valueOf(request.getId()))),
                HttpStatus.CREATED
        );
    }
}
