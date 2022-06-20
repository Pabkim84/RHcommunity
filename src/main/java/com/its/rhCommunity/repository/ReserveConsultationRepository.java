package com.its.rhCommunity.repository;

import com.its.rhCommunity.dto.ReserveConsultationDTO;
import com.its.rhCommunity.dto.ReserveDateTimeDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Repository
public class ReserveConsultationRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public List<ReserveDateTimeDTO> findAll() {
        return sql.selectList("ReserveDate.findAll");
    }
    public void save(ReserveDateTimeDTO reservationDTO) {
        sql.insert("ReserveDate.save", reservationDTO);
    }

    public ReserveDateTimeDTO findByDate(LocalDate reserveDate) {
        return sql.selectOne("ReserveDate.findByDate", reserveDate);
    }
    public void update1(ReserveDateTimeDTO reserveDateTimeDTO) {
        sql.update("ReserveDate.update1", reserveDateTimeDTO);
    }

    public void update2(ReserveDateTimeDTO reserveDateTimeDTO) {
        sql.update("ReserveDate.update2", reserveDateTimeDTO);
    }

    public void update3(ReserveDateTimeDTO reserveDateTimeDTO) {
        sql.update("ReserveDate.update3", reserveDateTimeDTO);
    }

    public void update4(ReserveDateTimeDTO reserveDateTimeDTO) {
        sql.update("ReserveDate.update4", reserveDateTimeDTO);
    }

    public void update5(ReserveDateTimeDTO reserveDateTimeDTO) {
        sql.update("ReserveDate.update5", reserveDateTimeDTO);
    }

    public void update6(ReserveDateTimeDTO reserveDateTimeDTO) {
        sql.update("ReserveDate.update6", reserveDateTimeDTO);
    }
}
