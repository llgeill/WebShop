package com.eill.Repository.product;

import com.eill.Pojo.ProductDetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;

public interface ProductDetailsDao extends JpaRepository<ProductDetails,String> {

    @Transactional
    @Modifying
    @Query("update ProductDetails p set p.stock=?1 where p.id=?2 ")
    public void updateStock(int stock,String id);

    @Transactional
    @Modifying
    @Query("update ProductDetails p set p.salesCount=?1 where p.id=?2 ")
    public void updateSalesCount(int salesCount,String id);

}
