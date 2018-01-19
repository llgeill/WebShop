package com.eill.Pojo;

import javax.persistence.*;

@Entity
@Table(name = "cart_details")
public class CartDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int id;
    @ManyToOne
    @JoinColumn(name = "cart_id", foreignKey = @ForeignKey(name = "cart_id"))
    public Cart cart;
    @ManyToOne
    @JoinColumn(name = "product_id", foreignKey = @ForeignKey(name = "product_cart_id"))
    public Product product;
    @Column(name = "product_count")
    public int productCount;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getProductCount() {
        return productCount;
    }

    public void setProductCount(int productCount) {
        this.productCount = productCount;
    }
}
