package vehicle_service.controller.v1.mapper;

import logging.annotations.Loggable;
import vehicle_service.controller.v1.request.AppRequest;
import vehicle_service.dto.model.AppModelDTO;

public class AppDTOMapper {

    @Loggable
    public AppModelDTO convertToDTO(AppRequest request) {
        AppModelDTO appModel = new AppModelDTO();
        appModel.setId(request.getId());
        appModel.setName(request.getName());
        return appModel;
    }
}
