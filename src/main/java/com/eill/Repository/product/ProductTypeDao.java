package com.eill.Repository.product;

import com.eill.Pojo.ProductType;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductTypeDao extends JpaRepository<ProductType,String> {
}
