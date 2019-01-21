package com.springmvc.dao;

import com.springmvc.entity.Flight;
import com.springmvc.entity.TreeData;

import java.util.List;

public interface FlightMapper {
    int deleteByPrimaryKey(Integer flightNo);//根据主键删除航班记录

    int insert(Flight record);//新添航班（含航班全部信息）

    int insertSelective(Flight record);//新添航班（可以只含有航班部分信息）

    Flight selectByPrimaryKey(Integer flightNo);//根据主键查找某个航班

    int updateByPrimaryKeySelective(Flight record);//更新航班信息（可以只更新部分信息）

    int updateByPrimaryKey(Flight record);//更新航班信息（更新全部信息）

    List<Flight> findAllFlight();//查找所有航班

    List<Flight> findFlightByCondition(Flight record);//查找条件检索航班

    List<Flight> getFlightsOfAirline(Integer airlineNo);//查找某航空公司的所有航班

    List<TreeData> getFlightTree();//获取Flight Tree
}