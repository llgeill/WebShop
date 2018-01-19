package com.eill.Service.product;

import com.eill.Pojo.Product;
import com.eill.Pojo.ProductDetails;
import com.eill.Pojo.ProductType;

import java.util.List;

public interface ProductService {
    public List<Product> getAllProduct();
    public List<ProductType> getAllProductType();
    public Product getProductById(String id);
    public void updateStock(int stock,String id);
    public void updateSalesCount(int salesCount,String id);
    public void saveProduct(Product product);
    public List<ProductType> findAllProductType();
    public void deleateProductById(String id);
}
