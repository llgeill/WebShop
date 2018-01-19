package com.eill.Repository.cart;

import com.eill.Pojo.Cart;
import com.eill.Pojo.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CartDao extends JpaRepository<Cart,String> {
    Cart findCartByUser(User user);

}
