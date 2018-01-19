package com.eill.Repository.order;

import com.eill.Pojo.Orders;
import com.eill.Pojo.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;
import java.util.List;

//@NamedNativeQueries
//        ({
//                @NamedNativeQuery(
//                name="ReturnOrderListWithFullScalarType",
//                query="select * from orders where orders.create_date=(select max(orders.create_date) from orders)",
//                resultSetMapping="Orders")
//
//                })
public interface OrdersDao extends JpaRepository<Orders,String> {
    List<Orders> findAllByUser(User user);
    @Query(value = "select * from orders where orders.create_date=(select max(orders.create_date) from orders)", nativeQuery = true)
    Orders findOrders();

}
