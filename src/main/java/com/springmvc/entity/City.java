package com.springmvc.entity;

import java.util.List;

public class City {
    private Integer cityNo;

    private String cityName;//城市名

    private List<Airport> airportList;//城市下属机场

    public List<Airport> getAirportList() {
        return airportList;
    }
    public void setAirportList(List<Airport> airportList) {
        this.airportList = airportList;
    }

    public Integer getCityNo() {
        return cityNo;
    }

    public void setCityNo(Integer cityNo) {
        this.cityNo = cityNo;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }
}