package com.eill.Pojo;

public class MyDate {
    public int year;
    public int month ;
    public int day;
    public int hour;
    public int mine;
    public int second;

    public MyDate(int year, int month, int day, int hour, int mine, int second) {
        this.year = year;
        this.month = month;
        this.day = day;
        this.hour = hour;
        this.mine = mine;
        this.second = second;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public int getHour() {
        return hour;
    }

    public void setHour(int hour) {
        this.hour = hour;
    }

    public int getMine() {
        return mine;
    }

    public void setMine(int mine) {
        this.mine = mine;
    }

    public int getSecond() {
        return second;
    }

    public void setSecond(int second) {
        this.second = second;
    }
}