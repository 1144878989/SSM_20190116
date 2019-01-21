package com.springmvc.dao;

import com.springmvc.entity.Airport;

import java.util.List;

public interface AirportMapper {
    int deleteByPrimaryKey(Integer airportNo);//根据主键删除机场记录

    int insert(Airport record);//新添机场（含机场部信息）

    int insertSelective(Airport record);//新添机场（可以只含有机场部分信息）

    Airport selectByPrimaryKey(Integer airportNo);//根据主键查找某个机场

    int updateByPrimaryKeySelective(Airport record);//更新机场信息（可以只更新部分信息）

    int updateByPrimaryKey(Airport record);//更新机场信息（更新全部信息）

    List<Airport> findAllAirport();//查找所有机场

    List<Airport> findAirportByCondition(Airport record);//查找条件检索机场
}