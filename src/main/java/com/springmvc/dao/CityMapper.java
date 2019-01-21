package com.springmvc.dao;

import com.springmvc.entity.City;
import com.springmvc.entity.TreeData;

import java.util.List;

public interface CityMapper {
    int deleteByPrimaryKey(Integer cityNo);//根据主键删除城市记录

    int insert(City record);//新添城市（含城市全部信息）

    int insertSelective(City record);//新添城市（可以只含有城市部分信息）

    City selectByPrimaryKey(Integer cityNo);//根据主键查找某个城市

    int updateByPrimaryKeySelective(City record);//更新城市信息（可以只更新部分信息）

    int updateByPrimaryKey(City record);//更新城市信息（更新全部信息）

    List<City> findAllCity();//查找所有城市

    List<TreeData> findAllCityTreeData();//生成城市的TreeData

    List<City> findCityByCondition(City record);//查找条件检索城市

    List<TreeData> getCityAirportTree();//生成城市-机场 的treedata
}