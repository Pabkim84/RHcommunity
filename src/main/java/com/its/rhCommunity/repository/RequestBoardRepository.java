package com.its.rhCommunity.repository;

import com.its.rhCommunity.dto.RequestBoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RequestBoardRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public List<RequestBoardDTO> findAll() {
        return sql.selectList("Board.findAll");
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
}
