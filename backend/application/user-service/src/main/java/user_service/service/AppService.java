package user_service.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import user_service.dto.model.AppModelDTO;
import user_service.repository.AppRepository;

@Service
public class AppService {

    @Autowired
    private AppRepository repository;



    public String greetService( String name ) {
        return repository.greetRepository(name);
    }

    public void saveUser(AppModelDTO model) {

    }
/*
    public ResponseEntity<Resource> download(String url, String blobName) {
        return fileUtil.downloadBlob(url, blobName);
    }

    public void delete(String url, String blobName) {
        fileUtil.deleteBlob(url, blobName);
    }

    public URI uploadBlob(MultipartFile file, String blobName) {
        return fileUtil.uploadFile(file, blobName);
    }

*/


}
