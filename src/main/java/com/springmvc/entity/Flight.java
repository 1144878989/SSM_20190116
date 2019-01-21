package com.springmvc.entity;

import java.util.Date;

public class Flight {
    private Integer flightNo;//航班主键

    private String flightTakeoffTime;//飞机起飞时间

    private String flightLandTime;//飞机降落时间

    private Integer flightTime;//飞行时间（分钟数）

    private Integer flightTakeoffPort;//飞机起飞航站楼ID

    private String flightTakeoffPortName;//飞机起飞航站楼名字

    private Integer flightLandPort;//飞机降落站楼ID

    private String flightLandPortName;//飞机降落站楼名字

    private Integer airlineNo;//航司编号

    private Boolean canFly;//是否可飞

    private String flightCode;//航班编号

    private Double flightFaremoney;//基础票价

    public Integer getFlightNo() { return flightNo; }

    public void setFlightNo(Integer flightNo) { this.flightNo = flightNo; }

    public String getFlightTakeoffTime() { return flightTakeoffTime; }

    public void setFlightTakeoffTime(String flightTakeoffTime) { this.flightTakeoffTime = flightTakeoffTime; }

    public String getFlightLandTime() { return flightLandTime; }

    public void setFlightLandTime(String flightLandTime) {
        this.flightLandTime = flightLandTime;
    }

    public Integer getFlightTakeoffPort() {
        return flightTakeoffPort;
    }

    public void setFlightTakeoffPort(Integer flightTakeoffPort) {
        this.flightTakeoffPort = flightTakeoffPort;
    }

    public Integer getFlightLandPort() {
        return flightLandPort;
    }

    public void setFlightLandPort(Integer flightLandPort) {
        this.flightLandPort = flightLandPort;
    }

    public Integer getAirlineNo() {
        return airlineNo;
    }

    public void setAirlineNo(Integer airlineNo) {
        this.airlineNo = airlineNo;
    }

    public Boolean getCanFly() {
        return canFly;
    }

    public void setCanFly(Boolean canFly) {
        this.canFly = canFly;
    }

    public String getFlightCode() {
        return flightCode;
    }

    public void setFlightCode(String flightCode) {
        this.flightCode = flightCode;
    }

    public Double getFlightFaremoney() {
        return flightFaremoney;
    }

    public void setFlightFaremoney(Double flightFaremoney) {
        this.flightFaremoney = flightFaremoney;
    }

    public Integer getFlightTime() {
        return flightTime;
    }

    public void setFlightTime(Integer flightTime) {
        this.flightTime = flightTime;
    }

    public String getFlightTakeoffPortName() {
        return flightTakeoffPortName;
    }

    public void setFlightTakeoffPortName(String flightTakeoffPortName) {
        this.flightTakeoffPortName = flightTakeoffPortName;
    }

    public String getFlightLandPortName() {
        return flightLandPortName;
    }

    public void setFlightLandPortName(String flightLandPortName) {
        this.flightLandPortName = flightLandPortName;
    }
}