package com.springmvc.dao;

import com.springmvc.entity.Airline;
import com.springmvc.entity.TreeData;

import java.util.List;

public interface AirlineMapper {
    int deleteByPrimaryKey(Integer airlineNo);//根据主键删除航空公司记录

    int insert(Airline record);//新添航空公司（含航空公司全部信息）

    int insertSelective(Airline record);//新添航空公司（可以只含有航空公司部分信息）

    Airline selectByPrimaryKey(Integer airlineNo);//根据主键查找某个航空公司

    int updateByPrimaryKeySelective(Airline record);//更新航空公司信息（可以只更新部分信息）

    int updateByPrimaryKey(Airline record);//更新航空公司信息（更新全部信息）

    List<Airline> findAllAirline();//查找所有航空公司

    List<Airline> findAirlineByCondition(Airline record);//查找条件检索航空公司

    List<TreeData> getAirlineTree();//生成航空公司的TreeData
}