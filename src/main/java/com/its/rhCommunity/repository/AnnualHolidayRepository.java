package com.its.rhCommunity.repository;

import com.its.rhCommunity.dto.AnnualHolidayDTO;
import com.its.rhCommunity.dto.HolidayAdminDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.YearMonth;
import java.util.List;

@Repository
public class AnnualHolidayRepository {
    @Autowired
    private SqlSessionTemplate sql;


    public void save(AnnualHolidayDTO annualHolidayDTO) {
        System.out.println("repository");
        sql.insert("Holiday.save", annualHolidayDTO);
    }

    public int countDays(Long id) {
       return sql.selectOne("Holiday.count", id);
    }

    public List<AnnualHolidayDTO> findByNumId(Long id) {
        return sql.selectList("Holiday.findByNumId", id);
    }

    public AnnualHolidayDTO findLastDateByNumId(Long id) {
        return sql.selectOne("Holiday.findLastDateByNumId", id);
    }

    public List<HolidayAdminDTO> findAllByMonth(String yearMonth) {
        return sql.selectList("Holiday.findAllByMonth", yearMonth);
    }

//    public void update(AnnualHolidayDTO annalHolidayDTO) {
//        sql.update("Holiday.update", annalHolidayDTO);
//    }
}
