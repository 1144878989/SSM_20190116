package com.springmvc.entity;

public class Airport {
    private Integer airportNo;//机场主键

    private String airportName;//机场名

    private String airportAddress;//机场位置

    private Integer cityNo;//城市编号

    public Integer getAirportNo() {
        return airportNo;
    }

    public void setAirportNo(Integer airportNo) {
        this.airportNo = airportNo;
    }

    public String getAirportName() {
        return airportName;
    }

    public void setAirportName(String airportName) {
        this.airportName = airportName;
    }

    public String getAirportAddress() {
        return airportAddress;
    }

    public void setAirportAddress(String airportAddress) {
        this.airportAddress = airportAddress;
    }

    public Integer getCityNo() {
        return cityNo;
    }

    public void setCityNo(Integer cityNo) {
        this.cityNo = cityNo;
    }
}