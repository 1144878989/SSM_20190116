package com.springmvc.controller;

import com.springmvc.dao.TicketMapper;
import com.springmvc.entity.Ticket;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@RequestMapping("ticket")
@Controller
public class TicketMagCtrl {
    @Autowired
    TicketMapper ticketMapper;
    //根据条件查询机票
    @RequestMapping("findTicketByCondition")
    @ResponseBody
    List<Ticket> findTicketByCondition(Ticket record){
        System.out.println("1111111");
        List<Ticket> list=ticketMapper.findTicketByCondition(record);
        return list;
    }
    @RequestMapping("selectByPrimaryKey")
    @ResponseBody
    Ticket selectByPrimaryKey(Integer ticketNo){//根据机票ID获取机票信息
        Ticket ticket=ticketMapper.selectByPrimaryKey(ticketNo);
        return ticket;
    }

    @RequestMapping("insertNewTicket")
    @ResponseBody
    String insertNewTicket(Ticket record){//添加新机票
        System.out.println(record.getFlightNo()+" "+record.getTicketCrsName()+" "+record.getTicketDate()+" "+record.getLogicalShip());
        if(record!=null){//判断record没有空指
            if(record.getTicketCrsName()!=null&&record.getLogicalShip()!=null&&record.getFlightNo()!=null&&record.getTicketDate()!=null) {
                Ticket ticket=new Ticket();
                ticket.setTicketCrsName(record.getTicketCrsName());
                ticket.setLogicalShip(record.getLogicalShip());
                ticket.setFlightNo(record.getFlightNo());
                ticket.setTicketDate(record.getTicketDate());
                List<Ticket> list=ticketMapper.findTicketByCondition(ticket);
                if (list.size() > 0) {//判断同种机票是否已存在
                    return "ticketExist";
                }//检查同名航班是否已存在
                else {
                    int n = ticketMapper.insertSelective(record);
                    if (n > 0) {
                        return "ticketInsertOk";
                    } else {
                        return "ticketInsertFail";
                    }
                }
            }else{
                return "needMoreError";
            }
        }
        else{ return "ticketNullPoint"; }
    }
    @RequestMapping("updateTicket")
    @ResponseBody
    String updateTicket(Ticket record){//编辑机票
        if(record!=null){//判断record没有空指
            Ticket seekResult=ticketMapper.selectByPrimaryKey(record.getTicketNo());
            if(seekResult!=null){//检查该机票ID是否存在
                int n=ticketMapper.updateByPrimaryKeySelective(record);
                if(n>0){ return "ticketUpdateOk";}
                else{return "ticketUpdateFail";}
            }
            else{//该机票不存在，不进行update操作
                return "ticketNotExist";
            }
        }
        else{ return "ticketNullPoint"; }
    }
    @RequestMapping("deleteTicket")
    @ResponseBody
    String deleteTicket(Integer ticketNo) {//删除机票
        if (ticketNo != null) {//判断ticketNo没有空指
            int n=ticketMapper.deleteByPrimaryKey(ticketNo);
            if(n>0){
                return "ticketDeleteOk";
            }else{
                return "ticketDeleteFail";
            }
        } else {
            return "ticketNoNullPoint";
        }
    }
}
