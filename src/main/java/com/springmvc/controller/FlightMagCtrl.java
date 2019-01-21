package com.springmvc.controller;

import com.springmvc.dao.AirlineMapper;
import com.springmvc.dao.FlightMapper;
import com.springmvc.entity.Airline;
import com.springmvc.entity.Flight;
import com.springmvc.entity.TreeData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@RequestMapping("flight")
@Controller
public class FlightMagCtrl {
    @Autowired
    AirlineMapper airlineMapper;
    @Autowired
    FlightMapper flightMapper;
    //生成航空公司的treedata
    @RequestMapping("getAirlineTree")
    @ResponseBody
    List<TreeData> getAirlineTree(){
        List<TreeData> list=airlineMapper.getAirlineTree();
        return list;
    }
    //根据航空公司查找航班
    @RequestMapping("getFlightsOfAirline")
    @ResponseBody
    List<Flight> getFlightsOfAirline(Integer airlineNo){
        Airline airline=airlineMapper.selectByPrimaryKey(airlineNo);//查该有没有该航空公司
        List<Flight> list= null;
        if(airline!=null){
            list=flightMapper.getFlightsOfAirline(airlineNo);
        }
        return list;
    }
    @RequestMapping("selectByPrimaryKey")
    @ResponseBody
    Flight selectByPrimaryKey(Integer flightNo){//根据航班ID获取航班信息
        Flight flight=flightMapper.selectByPrimaryKey(flightNo);
        return flight;
    }

    @RequestMapping("insertNewAirline")
    @ResponseBody
    String insertNewAirline(Airline record){    //添加新航空公司
        if(record!=null){//判断record没有空指
            if(record.getAirlineName()!=null&&record.getAirlineName().length()>0){
                Airline seekNeed=new Airline();
                seekNeed.setAirlineName(record.getAirlineName());
                List<Airline> list=airlineMapper.findAirlineByCondition(seekNeed);
                if(list.size()>0){return "airlineExist";}//检查同名航空公司是否已存在
                else{
                    int n=airlineMapper.insertSelective(record);
                    if(n>0){ return "airlineInsertOk";}
                    else{return "airlineInsertFail";}
                }
            }
            else{ return "airlineEmptyError"; }
        }
        else{ return "airlineNullPoint"; }

    }
    @RequestMapping("insertNewFlight")
    @ResponseBody
    String insertNewFlight(Flight record){//添加新航班
        if(record!=null){//判断record没有空指
            if(record.getAirlineNo()!=null&&airlineMapper.selectByPrimaryKey(record.getAirlineNo())!=null) {//判断该航空公司ID是否正确
                if (record.getFlightCode() != null && record.getFlightCode().length() > 0) {//判断航班信息是否可添加
                    Flight flight=new Flight();
                    flight.setFlightCode(record.getFlightCode());
                    List<Flight> list = flightMapper.findFlightByCondition(flight);
                    if (list.size() > 0) {
                        return "flightExist";
                    }//检查同名航班是否已存在
                    else {
                        if(record.getCanFly()==null){
                            record.setCanFly(false);
                        }
                        int n = flightMapper.insertSelective(record);
                        if (n > 0) {
                            return "flightInsertOk";
                        } else {
                            return "flightInsertFail";
                        }
                    }
                } else {
                    return "flightEmptyError";
                }
            }else{
                return "airlineNotFindError";
            }
        }
        else{ return "airlineNullPoint"; }
    }
    @RequestMapping("updateFlight")
    @ResponseBody
    String updateFlight(Flight record){//编辑航班
        System.out.println(record.getFlightCode()+","+record.getFlightNo()+","+record.getCanFly());
        if(record!=null){//判断record没有空指
            Flight seekResult=flightMapper.selectByPrimaryKey(record.getFlightNo());
            if(seekResult!=null){//检查该航班ID是否存在
                int n=flightMapper.updateByPrimaryKeySelective(record);
                if(n>0){ return "flightUpdateOk";}
                else{return "flightUpdateFail";}
            }
            else{//该航班航班不存在，不进行update操作
                return "flightNotExist";
            }
        }
        else{ return "flightNullPoint"; }
    }
    @RequestMapping("deleteFlight")
    @ResponseBody
    String deleteFlight(Integer flightNo) {//删除航班
        if (flightNo != null) {//判断flightNo没有空指
            int n=flightMapper.deleteByPrimaryKey(flightNo);
            if(n>0){
                return "flightDeleteOk";
            }else{
                return "flightDeleteFail";
            }
        } else {
            return "flightNoNullPoint";
        }
    }
    @RequestMapping("getFlightTree")
    @ResponseBody
    List<TreeData> getFlightTree(){
        List<TreeData> list=flightMapper.getFlightTree();
        return list;

    }
}
