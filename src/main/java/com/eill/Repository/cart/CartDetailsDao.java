package com.eill.Repository.cart;

import com.eill.Pojo.Cart;
import com.eill.Pojo.CartDetails;
import com.eill.Pojo.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;
import java.util.List;

@Transactional
public interface CartDetailsDao  extends JpaRepository<CartDetails,Integer>{

    @Modifying
    @Query("update CartDetails p set p.productCount = ?1 where p.product.id=?2 and p.cart.id=?3")
     int updateProductCount(int productCount,String ProductId,String cartId);

    CartDetails findByCartAndProduct(Cart cart, Product product);

    @Query("select p.productCount from CartDetails p where p.cart.id=?1 and p.product.id=?2")
    int findProductCount(String cartId,String productId);

    List<CartDetails> findAllByCart(Cart cart);

    List<CartDetails> findByCart(Cart cart);





}
