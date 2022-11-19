package com.its.rhCommunity.service;

import com.its.rhCommunity.dto.NoticeDTO;
import com.its.rhCommunity.dto.PageDTO;
import com.its.rhCommunity.dto.RequestBoardDTO;
import com.its.rhCommunity.repository.RequestBoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RequestBoardService {
    @Autowired
    private RequestBoardRepository requestBoardRepository;
//    public List<RequestBoardDTO> findAll() {
//        return requestBoardRepository.findAll();
//    }

    public void save(RequestBoardDTO requestBoardDTO) throws IOException {
        MultipartFile file = requestBoardDTO.getFile();
        String fileName = file.getOriginalFilename();
        fileName = System.currentTimeMillis() + "-" + fileName;
        String savePath = "C:\\/springboot_img/\\" + fileName;
        if (!fileName.isEmpty()) {
            requestBoardDTO.setFileName(fileName);
            file.transferTo(new File(savePath));
        }
        requestBoardRepository.save(requestBoardDTO);
    }

    public RequestBoardDTO findById(Long id) {

        return requestBoardRepository.findById(id);
    }

    public void update(RequestBoardDTO requestBoardDTO) throws IOException {
        System.out.println("requestBoardDTO = " + requestBoardDTO);
        MultipartFile file = requestBoardDTO.getFile();
        String fileName = file.getOriginalFilename();
        fileName = System.currentTimeMillis() + "-" + fileName;
        String savePath = "C:\\/springboot_img/\\"  + fileName;
        System.out.println("fileName = " + fileName);
        if (!file.isEmpty()) {
            requestBoardDTO.setFileName(fileName);
            file.transferTo(new File(savePath));
            System.out.println("requestBoardDTO = if ==" + requestBoardDTO);
        } else {
            RequestBoardDTO boardDTO = requestBoardRepository.findById(requestBoardDTO.getId());
            requestBoardDTO.setFileName(boardDTO.getFileName());
            System.out.println("requestBoardDTO = else ==" + requestBoardDTO);
        }
        requestBoardRepository.update(requestBoardDTO);
    }

    private static final int PAGE_LIMIT = 10;
    private static final int BLOCK_LIMIT = 10;

    public List<RequestBoardDTO> findAll(int page) {
        int pagingStart = (page - 1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        List<RequestBoardDTO> pagingList = requestBoardRepository.findAll(pagingParam);
        return pagingList;
    }

    public PageDTO paging(int page) {
        int boardCount = requestBoardRepository.boardCount();
        int maxPage = (int) (Math.ceil((double) boardCount / PAGE_LIMIT));
        int startPage = (((int) (Math.ceil((double) page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
        int endPage = startPage + BLOCK_LIMIT - 1;
        if (endPage > maxPage) {
            endPage = maxPage;
        }
        PageDTO paging = new PageDTO();
        paging.setPage(page);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setMaxPage(maxPage);

        return paging;
    }

    public void delete(Long id) {
        requestBoardRepository.delete(id);
    }

    public void updateHits(Long id) {
        requestBoardRepository.updateHits(id);
    }
}