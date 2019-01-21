package com.springmvc.controller;

import com.springmvc.dao.AirportMapper;
import com.springmvc.dao.CityMapper;
import com.springmvc.dao.TerminalMapper;
import com.springmvc.entity.Airport;
import com.springmvc.entity.City;
import com.springmvc.entity.Terminal;
import com.springmvc.entity.TreeData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("airport")
public class AirportMagCtrl {
    @Autowired
    CityMapper cityMapper;
    @Autowired
    AirportMapper airportMapper;
    @Autowired
    TerminalMapper terminalMapper;
    @RequestMapping("getCityAirportTree")
    @ResponseBody
    List<TreeData> getCityAirportTree(){//生成城市-机场 组织树
        List<TreeData> list=cityMapper.getCityAirportTree();
        for (int i=0;i<list.size();i++){
            list.get(i).setAttributes("city");
            for (int j=0;j<list.get(i).getChildren().size();i++){
                list.get(i).getChildren().get(j).setAttributes("airport");
            }
        }
        return list;
    }
    @RequestMapping("getTerminalTree")
    @ResponseBody
    List<TreeData> getTerminalTree(){//生成 航站楼 dataTree
        List<TreeData> list=terminalMapper.getTerminalTree();
        return list;
    }
    @RequestMapping("getCityList")
    @ResponseBody
    List<TreeData> getCityList(){//返回城市 TreeData
        List<TreeData> list=cityMapper.findAllCityTreeData();
        return list;
    }
    @RequestMapping("selectByPrimaryKey")
    @ResponseBody
    Terminal selectByPrimaryKey(Integer terminalNo){//根据航站楼ID获取航站楼信息
        Terminal terminal=terminalMapper.selectByPrimaryKey(terminalNo);
        return terminal;
    }
    @RequestMapping("getTerminalsOfAirport")
    @ResponseBody
    List<Terminal> getTerminalsOfAirport(Integer airportNo){//查找某机场的所有航站楼
        if(airportNo!=null){
            Airport airport=airportMapper.selectByPrimaryKey(airportNo);//判断该机场号是否正确
            if(airport!=null){
                List<Terminal> list=terminalMapper.findTerminalsOfAirport(airportNo);
                for (Terminal  a:list ) {
                    System.out.println(a.getTerminalName());
                }
                return list;
            }else{
                return null;
            }

        }else{
            return null;
        }
    }
    @RequestMapping("insertNewAirport")
    @ResponseBody
    String insertNewAirport(Airport record){    //添加新机场
        if(record!=null){//判断record没有空指
            if(record.getAirportName()!=null&&record.getAirportName().length()>0){
                Airport seekNeed=new Airport();
                seekNeed.setAirportName(record.getAirportName());
                List<Airport> list=airportMapper.findAirportByCondition(seekNeed);
                if(list.size()>0){return "airportExist";}//检查同名机场是否已存在
                else{
                    int n=airportMapper.insertSelective(record);
                    if(n>0){ return "airportInsertOk";}
                    else{return "airportInsertFail";}
                }
            }
            else{ return "airportEmptyError"; }
        }
        else{ return "airportNullPoint"; }

    }
    @RequestMapping("insertNewCity")
    @ResponseBody
    String insertNewCity(City record){//添加新城市
        if(record!=null){//判断record没有空指
            if(record.getCityName()!=null&&record.getCityName().length()>0){
                List<City> list=cityMapper.findCityByCondition(record);
                if(list.size()>0){return "cityExist";}//检查同名城市是否已存在
                else{
                    int n=cityMapper.insertSelective(record);
                    if(n>0){ return "cityInsertOk";}
                    else{return "cityInsertFail";}
                }
            }
            else{ return "cityEmptyError"; }
            }
        else{ return "airportNullPoint"; }
    }
    @RequestMapping("insertNewTerminal")
    @ResponseBody
    String insertNewTerminal(Terminal record){//添加新航站楼
        if(record!=null){//判断record没有空指
            if(record.getAirportNo()!=null&&airportMapper.selectByPrimaryKey(record.getAirportNo())!=null) {//判断该机场ID是否正确
                if (record.getTerminalName() != null && record.getTerminalName().length() > 0) {//判断航站楼信息是否可添加
                    List<Terminal> list = terminalMapper.findTerminalFromAirport(record);
                    if (list.size() > 0) {
                        return "terminalExist";
                    }//检查同名城市是否已存在
                    else {
                        int n = terminalMapper.insertSelective(record);
                        if (n > 0) {
                            return "terminalInsertOk";
                        } else {
                            return "terminalInsertFail";
                        }
                    }
                } else {
                    return "terminalEmptyError";
                }
            }else{
                return "airportNotFindError";
            }
        }
        else{ return "airportNullPoint"; }
    }
    @RequestMapping("updateTerminal")
    @ResponseBody
    String updateTerminal(Terminal record){//编辑航站楼
        if(record!=null){//判断record没有空指
            Terminal seekResult=terminalMapper.selectByPrimaryKey(record.getTerminalNo());
            if(seekResult!=null){//检查该航站楼ID是否存在
                int n=terminalMapper.updateByPrimaryKeySelective(record);
                if(n>0){ return "terminalUpdateOk";}
                else{return "terminalUpdateFail";}
            }
            else{//该航站楼不存在，不进行update操作
                return "terminalNotExist";
            }
        }
        else{ return "airportNullPoint"; }
    }
    @RequestMapping("deleteTerminal")
    @ResponseBody
    String deleteTerminal(Integer terminalNo) {//删除航站楼
        if (terminalNo != null) {//判断terminalNo没有空指
            int n=terminalMapper.deleteByPrimaryKey(terminalNo);
             if(n>0){
                return "terminalDeleteOk";
             }else{
                 return "terminalDeleteFail";
             }
        } else {
            return "terminalNoNullPoint";
        }
    }
}
