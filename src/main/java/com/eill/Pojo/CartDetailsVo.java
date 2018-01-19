package com.eill.Pojo;

import java.math.BigDecimal;

public class CartDetailsVo extends CartDetails {
    public BigDecimal allPrice;
    public double price;


    public BigDecimal getAllPrice() {
        return allPrice;
    }

    public void setAllPrice(BigDecimal allPrice) {
        this.allPrice = allPrice;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
