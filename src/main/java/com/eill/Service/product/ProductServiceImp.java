package com.eill.Service.product;

import com.eill.Pojo.Product;
import com.eill.Pojo.ProductType;
import com.eill.Repository.product.ProductDao;
import com.eill.Repository.product.ProductDetailsDao;
import com.eill.Repository.product.ProductTypeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("productService")
public class ProductServiceImp implements ProductService{
    @Autowired
    private ProductDao productDao;
    @Autowired
    private ProductTypeDao productTypeDao;
    @Autowired
    private ProductDetailsDao productDetailsDao;
    @Override
    public List<Product> getAllProduct() {
        List<Product> productList=productDao.findAll();
        return productList;

    }

    @Override
    public List<ProductType> getAllProductType() {
        return productTypeDao.findAll();
    }

    @Override
    public Product getProductById(String id) {
        return  productDao.findOne(id);
    }

    @Override
    public void updateStock(int stock,String id) {
        productDetailsDao.updateStock(stock,id);
    }

    @Override
    public void updateSalesCount(int salesCount, String id) {
        productDetailsDao.updateSalesCount(salesCount,id);
    }

    @Override
    public void saveProduct(Product product) {
        productDao.saveAndFlush(product);
    }

    @Override
    public List<ProductType> findAllProductType() {
        return productTypeDao.findAll();
    }

    @Override
    public void deleateProductById(String id) {
        productDao.delete(id);
    }
}
