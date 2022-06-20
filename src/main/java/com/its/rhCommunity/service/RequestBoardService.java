package com.its.rhCommunity.service;

import com.its.rhCommunity.dto.RequestBoardDTO;
import com.its.rhCommunity.repository.RequestBoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class RequestBoardService {
    @Autowired
    private RequestBoardRepository requestBoardRepository;
    public List<RequestBoardDTO> findAll() {
        return requestBoardRepository.findAll();
    }

    public void save(RequestBoardDTO requestBoardDTO) throws IOException {
        MultipartFile file = requestBoardDTO.getFile();
        String fileName = file.getOriginalFilename();
        fileName = System.currentTimeMillis()+"-"+fileName;
        String savePath ="E:\\/developement_pk/source/spring_framework/spring_img/\\" + fileName;
        if(!fileName.isEmpty()){
            requestBoardDTO.setFileName(fileName);
            file.transferTo(new File(savePath));
        }
        requestBoardRepository.save(requestBoardDTO);
    }

    public RequestBoardDTO findById(Long id) {
        return requestBoardRepository.findById(id);
    }

    public void update(RequestBoardDTO requestBoardDTO) throws IOException {
        MultipartFile file = requestBoardDTO.getFile();
        String fileName = file.getOriginalFilename();
        fileName = System.currentTimeMillis()+"-"+fileName;
        String savePath ="E:\\/developement_pk/source/spring_framework/spring_img/\\" + fileName;
        if(!fileName.isEmpty()){
            requestBoardDTO.setFileName(fileName);
            file.transferTo(new File(savePath));
        }
        requestBoardRepository.update(requestBoardDTO);
    }

    public void delete(Long id) {
        requestBoardRepository.delete(id);
    }
}
