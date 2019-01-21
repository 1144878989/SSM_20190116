package com.springmvc.dao;

import com.springmvc.entity.Ticket;

import java.util.List;

public interface TicketMapper {
    int deleteByPrimaryKey(Integer ticketNo);//根据主键删除机票种类记录

    int insert(Ticket record);//新添机票种类（含机票种类全部信息）

    int insertSelective(Ticket record);//新添机票种类（可以只含有部分信息）

    Ticket selectByPrimaryKey(Integer ticketNo);//根据主键查找某个机票种类

    int updateByPrimaryKeySelective(Ticket record);//更新机票种类信息（可以只更新部分信息）

    int updateByPrimaryKey(Ticket record);//更新机票种类信息（更新全部信息）

    List<Ticket> findAllTicket();//查找所有机票

    List<Ticket> findTicketByCondition(Ticket record);//查找条件检索机票
}