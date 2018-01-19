package com.eill.Service.order;

import com.eill.Pojo.Orders;
import com.eill.Pojo.OrdersDetails;
import com.eill.Pojo.User;
import com.eill.Repository.order.OrdersDao;
import com.eill.Repository.order.OrdersDetailsDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service("orderService")
@Transactional
public class OrderServiceImp implements OrderService {
    @Autowired
    private OrdersDao ordersDao;
    @Autowired
    private OrdersDetailsDao ordersDetailsDao;
    @Override
    public void insertOrder(Orders orders) {
        ordersDao.save(orders);
    }

    @Override
    public void insertOrderDetails(OrdersDetails ordersDetails) {
        ordersDetailsDao.save(ordersDetails);
    }

    @Override
    public List<Orders> findAllOrderByUser(User user) {
       return ordersDao.findAllByUser(user);
    }

    @Override
    public Orders findOneById(String id) {
        return ordersDao.findOne(id);
    }

    @Override
    public Orders findFirst() {
        return ordersDao.findOrders();
    }

    @Override
    public List<OrdersDetails> findAllByOrder(Orders order) {
        return ordersDetailsDao.findAllByOrders(order);
    }

    @Override
    public List<Orders> findAllOrders() {
        return ordersDao.findAll();
    }

    @Override
    public Page<Orders> findAll(int page,int size) {
        return ordersDao.findAll(new PageRequest(page,size));
    }


}
