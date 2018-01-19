package com.eill.Pojo;

import javax.persistence.*;

@Entity
@Table(name = "product_details")
public class ProductDetails {
    @Id
    public String id;
    @Column(name = "one_price")
    public Double onePrice;
    @Column(name = "two_price")
    public Double twoPrice;
    @Column(name = "one_count")
    public Integer oneCount;
    @Column(name = "two_count")
    public Integer twoCount;
    @Column(name = "stock")
    public Integer stock;
    @Column(name = "sales_count")
    public Integer salesCount;
    @Column(name = "product_instruction")
    public String productInstruction;
    @Column(name = "product_image")
    public String productImage;
    @Column(name = "is_week")
    public Integer isWeek;
    @Column(name = "is_month")
    public Integer isMonth;
    @Column(name = "is_year")
    public Integer isYear;
    @Column(name = "is_carousel")
    public Integer isCarousel;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Double getOnePrice() {
        return onePrice;
    }

    public void setOnePrice(Double onePrice) {
        this.onePrice = onePrice;
    }

    public Double getTwoPrice() {
        return twoPrice;
    }

    public void setTwoPrice(Double twoPrice) {
        this.twoPrice = twoPrice;
    }

    public Integer getOneCount() {
        return oneCount;
    }

    public void setOneCount(Integer oneCount) {
        this.oneCount = oneCount;
    }

    public Integer getTwoCount() {
        return twoCount;
    }

    public void setTwoCount(Integer twoCount) {
        this.twoCount = twoCount;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Integer getSalesCount() {
        return salesCount;
    }

    public void setSalesCount(Integer salesCount) {
        this.salesCount = salesCount;
    }

    public String getProductInstruction() {
        return productInstruction;
    }

    public void setProductInstruction(String productInstruction) {
        this.productInstruction = productInstruction;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public Integer getIsWeek() {
        return isWeek;
    }

    public void setIsWeek(Integer isWeek) {
        this.isWeek = isWeek;
    }

    public Integer getIsMonth() {
        return isMonth;
    }

    public void setIsMonth(Integer isMonth) {
        this.isMonth = isMonth;
    }

    public Integer getIsYear() {
        return isYear;
    }

    public void setIsYear(Integer isYear) {
        this.isYear = isYear;
    }

    public Integer getIsCarousel() {
        return isCarousel;
    }

    public void setIsCarousel(Integer isCarousel) {
        this.isCarousel = isCarousel;
    }
}
