package com.eill.Repository.order;

import com.eill.Pojo.Orders;
import com.eill.Pojo.OrdersDetails;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrdersDetailsDao extends JpaRepository<OrdersDetails,Integer> {
    List<OrdersDetails> findAllByOrders(Orders orders);
}
