package com.eill.Service.cart;


import com.eill.Pojo.Cart;
import com.eill.Pojo.CartDetails;
import com.eill.Pojo.Product;
import com.eill.Pojo.User;

import java.util.List;


public interface CartService {
    public List<CartDetails> getAllproduce(Cart cart);
    public void updateProduceCount(int productCount,String productId,String cartId);
    public CartDetails findByCartAndProduct(Cart cart, Product product);
    public int getProductCount(String cartID,String productId);
    public Cart findCartByUser(User user);
    public List<CartDetails> findAllByCart(Cart cart);
    void deleateCartDetails(CartDetails cartDetails);
    void deleateCart(Cart cart);
    public void saveCart(Cart cart);
    public List<CartDetails> getCartDetailsById(Cart cart);
    public void saveCartDetails(CartDetails cartDetails);

}
