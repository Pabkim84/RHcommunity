package com.its.rhCommunity.repository;

import com.its.rhCommunity.dto.RequestBoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class RequestBoardRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public List<RequestBoardDTO> findAll(Map<String, Integer> pagingParam) {

        return sql.selectList("Board.findAll", pagingParam);
    }

    public void save(RequestBoardDTO requestBoardDTO) {
        sql.insert("Board.save", requestBoardDTO);
    }

    public RequestBoardDTO findById(Long id) {
       return sql.selectOne("Board.findById", id);
    }

    public void update(RequestBoardDTO requestBoardDTO) {
        sql.update("Board.update", requestBoardDTO);
    }

    public void delete(Long id) {
        sql.delete("Board.delete", id);
    }

    public int boardCount() {
        return sql.selectOne("Board.count");

    }

    public void updateHits(Long id) {
        sql.update("Board.updateHits", id);
    }
}
