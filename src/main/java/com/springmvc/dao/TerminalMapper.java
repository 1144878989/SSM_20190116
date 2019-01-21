package com.springmvc.dao;

import com.springmvc.entity.Terminal;
import com.springmvc.entity.TreeData;

import java.util.List;

public interface TerminalMapper {
    int deleteByPrimaryKey(Integer terminalNo);//根据主键删除航站楼记录

    int insert(Terminal record);//新添航站楼（含全部信息）

    int insertSelective(Terminal record);//新添航站楼（可以只含有航站楼部分信息）

    Terminal selectByPrimaryKey(Integer terminalNo);//根据主键查找某个航站楼

    int updateByPrimaryKeySelective(Terminal record);//更新航站楼信息（可以只更新部分信息）

    int updateByPrimaryKey(Terminal record);//更新航站楼信息（更新全部信息）

    List<Terminal> findAllTerminal();//查找所有航站楼

    List<Terminal> findTerminalByCondition(Terminal record);//查找条件检索航站楼

    List<Terminal> findTerminalFromAirport(Terminal record);//查找某机场的下有没有同名航站楼

    List<Terminal> findTerminalsOfAirport(Integer airportNo);//查找某机场下的所有航站楼

    List<TreeData> getTerminalTree();//生成航站楼Tree
}