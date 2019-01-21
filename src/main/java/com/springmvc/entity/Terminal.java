package com.springmvc.entity;

public class Terminal {
    private Integer terminalNo;//航站楼

    private String terminalName;//航站楼名字

    private String terminalAddress;//航站楼地址

    private Integer airportNo;//机场编号

    private String airportAddress;//机场地址

    public Integer getTerminalNo() {
        return terminalNo;
    }

    public void setTerminalNo(Integer terminalNo) {
        this.terminalNo = terminalNo;
    }

    public String getTerminalName() {
        return terminalName;
    }

    public void setTerminalName(String terminalName) {
        this.terminalName = terminalName;
    }

    public String getTerminalAddress() {
        return terminalAddress;
    }

    public void setTerminalAddress(String terminalAddress) {
        this.terminalAddress = terminalAddress;
    }

    public Integer getAirportNo() {
        return airportNo;
    }

    public void setAirportNo(Integer airportNo) {
        this.airportNo = airportNo;
    }

    public String getAirportAddress() {
        return airportAddress;
    }

    public void setAirportAddress(String airportAddress) {
        this.airportAddress = airportAddress;
    }
}