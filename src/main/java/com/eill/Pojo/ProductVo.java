package com.eill.Pojo;

import java.util.List;

public class ProductVo {
    private ProductType productType;
    private List<Product> productList;

    public ProductType getProductType() {
        return productType;
    }

    public void setProductType(ProductType productType) {
        this.productType = productType;
    }

    public List<Product> getProductList() {
        return productList;
    }

    public void setProductList(List<Product> productList) {
        this.productList = productList;
    }
}
