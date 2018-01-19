package com.eill.Pojo;

import javax.persistence.*;

@Entity
@Table(name = "orders_details")
public class OrdersDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int id;
    @ManyToOne
    @JoinColumn(name = "orders_id", foreignKey = @ForeignKey(name = "orders_id"))
    public Orders orders;
    @ManyToOne
    @JoinColumn(name = "product_id", foreignKey = @ForeignKey(name = "product_orders_id"))
    public Product product;
    @Column(name = "product_count")
    public int productCount;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Orders getOrders() {
        return orders;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
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
