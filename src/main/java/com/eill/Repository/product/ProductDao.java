package com.eill.Repository.product;

import com.eill.Pojo.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;

public interface ProductDao extends JpaRepository<Product,String> {

    @Transactional
    @Modifying
    @Query("update ProductDetails p set p.stock=?1 where p.id=?2 ")
    public void updateProduct(int stock,String id);

}
