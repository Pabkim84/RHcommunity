package com.its.rhCommunity.repository;

import com.its.rhCommunity.dto.NoticeDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.Map;

@Repository
public class NoticeRepository {

    @Autowired
    private SqlSessionTemplate sql;

    public List<NoticeDTO> findAll(Map<String, Integer> pagingParam) {
        return sql.selectList("Notice.findAll", pagingParam);
    }

    public void save(NoticeDTO noticeDTO) {
        sql.insert("Notice.save", noticeDTO);
    }

    public int noticeCount() {

        return sql.selectOne("Notice.count");
    }

    public NoticeDTO findById(Long id) {
        return sql.selectOne("Notice.findById", id);
    }

    public void update(NoticeDTO noticeDTO) {
        sql.update("Notice.update", noticeDTO);
    }

    public void updateHits(Long id) {
        sql.update("Notice.updateHits", id);
    }

    public void delete(Long id) {
        sql.delete("Notice.delete", id);
    }
}
