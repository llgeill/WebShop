package com.eill.Pojo;

import javax.persistence.*;

@Entity
@Table(name = "product")
public class Product{
    @Id
    public String id;
    public String name;
    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "product_type_id", foreignKey = @ForeignKey(name = "product_type_id"))
    public ProductType productType;
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "product_details_id", foreignKey = @ForeignKey(name = "product_details_id"))
    public ProductDetails productDetails;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ProductType getProductType() {
        return productType;
    }

    public void setProductType(ProductType productType) {
        this.productType = productType;
    }

    public ProductDetails getProductDetails() {
        return productDetails;
    }

    public void setProductDetails(ProductDetails productDetails) {
        this.productDetails = productDetails;
    }
}
