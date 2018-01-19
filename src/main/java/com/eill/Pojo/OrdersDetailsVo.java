package com.eill.Pojo;

import java.math.BigDecimal;
import java.util.List;

public class OrdersDetailsVo {
    public Orders orders;
    public BigDecimal allprice;
    public List<OrdersDetails> ordersDetailsList;
    public User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Orders getOrders() {
        return orders;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
    }

    public BigDecimal getAllprice() {
        return allprice;
    }

    public void setAllprice(BigDecimal allprice) {
        this.allprice = allprice;
    }

    public List<OrdersDetails> getOrdersDetailsList() {
        return ordersDetailsList;
    }

    public void setOrdersDetailsList(List<OrdersDetails> ordersDetailsList) {
        this.ordersDetailsList = ordersDetailsList;
    }
}
