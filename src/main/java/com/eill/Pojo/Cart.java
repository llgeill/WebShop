package com.eill.Pojo;

import javax.persistence.*;

@Entity
@Table(name ="cart" )
public class Cart {
    @Id
    public String id;
    @ManyToOne
    @JoinColumn(name = "user_id", foreignKey = @ForeignKey(name = "user_cart_id"))
    public User user;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
