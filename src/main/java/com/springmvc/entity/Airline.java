package com.springmvc.entity;

public class Airline {
    private Integer airlineNo;//航司主键

    private String airlineName;//航司名

    private String airlineCode;//航司编号

    private String airlineIcs;//航司系统

    public Integer getAirlineNo() {
        return airlineNo;
    }

    public void setAirlineNo(Integer airlineNo) {
        this.airlineNo = airlineNo;
    }

    public String getAirlineName() {
        return airlineName;
    }

    public void setAirlineName(String airlineName) {
        this.airlineName = airlineName;
    }

    public String getAirlineCode() {
        return airlineCode;
    }

    public void setAirlineCode(String airlineCode) {
        this.airlineCode = airlineCode;
    }

    public String getAirlineIcs() {
        return airlineIcs;
    }

    public void setAirlineIcs(String airlineIcs) {
        this.airlineIcs = airlineIcs;
    }
}