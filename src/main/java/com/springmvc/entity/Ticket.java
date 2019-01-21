package com.springmvc.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Date;
import java.sql.Timestamp;

public class Ticket {
    private Integer ticketNo;//机票种类编号

    private Double ticketSellmoney;//机票销售价格

    private Double ticketTax;//税费

    private String ticketCrsName;//机票代理人

    private Integer ticketBooking;//余票

    private Integer flightNo;//航班

    private String flightCode;//航班编号ID

    private String logicalShip;//逻辑舱位

    @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
    private Date ticketDate;//起飞时间

    public Integer getTicketNo() {
        return ticketNo;
    }

    public void setTicketNo(Integer ticketNo) {
        this.ticketNo = ticketNo;
    }

    public Double getTicketSellmoney() {
        return ticketSellmoney;
    }

    public void setTicketSellmoney(Double ticketSellmoney) {
        this.ticketSellmoney = ticketSellmoney;
    }

    public Double getTicketTax() {
        return ticketTax;
    }

    public void setTicketTax(Double ticketTax) {
        this.ticketTax = ticketTax;
    }

    public String getTicketCrsName() {
        return ticketCrsName;
    }

    public void setTicketCrsName(String ticketCrsName) {
        this.ticketCrsName = ticketCrsName;
    }

    public Integer getTicketBooking() {
        return ticketBooking;
    }

    public void setTicketBooking(Integer ticketBooking) {
        this.ticketBooking = ticketBooking;
    }

    public Integer getFlightNo() {
        return flightNo;
    }

    public void setFlightNo(Integer flightNo) {
        this.flightNo = flightNo;
    }

    public String getFlightCode() {
        return flightCode;
    }

    public void setFlightCode(String flightCode) {
        this.flightCode = flightCode;
    }

    public String getLogicalShip() {
        return logicalShip;
    }

    public void setLogicalShip(String logicalShip) {
        this.logicalShip = logicalShip;
    }
    public Date getTicketDate() {
        return ticketDate;
    }
    public void setTicketDate(Date ticketDate) {
        this.ticketDate = ticketDate;
    }
}