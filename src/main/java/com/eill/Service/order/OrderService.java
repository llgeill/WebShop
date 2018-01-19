package com.eill.Service.order;

import com.eill.Pojo.Orders;
import com.eill.Pojo.OrdersDetails;
import com.eill.Pojo.User;
import org.springframework.data.domain.Page;

import java.util.List;

public interface OrderService {
    void insertOrder(Orders orders);
    void insertOrderDetails(OrdersDetails ordersDetails);
    List<Orders> findAllOrderByUser(User user);
    Orders findOneById(String id);
    Orders findFirst();
    List<OrdersDetails> findAllByOrder(Orders order);
    List<Orders> findAllOrders();
    Page<Orders> findAll(int page,int size);
}
