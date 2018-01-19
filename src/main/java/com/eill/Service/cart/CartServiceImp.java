package com.eill.Service.cart;

import com.eill.Pojo.Cart;
import com.eill.Pojo.CartDetails;
import com.eill.Pojo.Product;
import com.eill.Pojo.User;
import com.eill.Repository.cart.CartDao;
import com.eill.Repository.cart.CartDetailsDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.lang.String;

@Service("cartService")
@Transactional
public class CartServiceImp implements CartService{

    @Autowired
    private CartDetailsDao cartDetailsDao;
    @Autowired
    private CartDao cartDao;

    @Override
    public List<CartDetails> getAllproduce(Cart cart) {
        return cartDetailsDao.findAllByCart(cart);
    }

    @Override
    public void updateProduceCount(int productCount, String productId, String cartId) {
        cartDetailsDao.updateProductCount(productCount,productId,cartId);
    }


    @Override
    public CartDetails findByCartAndProduct(Cart cart, Product product) {
        return cartDetailsDao.findByCartAndProduct(cart,product);
    }



    @Override
    public int getProductCount(java.lang.String cartID, java.lang.String productId) {
        return cartDetailsDao.findProductCount(cartID,productId);
    }

    @Override
    public Cart findCartByUser(User user) {
        return cartDao.findCartByUser(user);
    }

    @Override
    public List<CartDetails> findAllByCart(Cart cart) {

        return cartDetailsDao.findAllByCart(cart);
    }

    @Override
    public void deleateCartDetails(CartDetails cartDetails) {
        cartDetailsDao.delete(cartDetails);
    }

    @Override
    public void deleateCart(Cart cart) {
        cartDao.delete(cart);
    }

    @Override
    public void saveCart(Cart cart) {
        cartDao.saveAndFlush(cart);
    }


    @Override
    public List<CartDetails> getCartDetailsById(Cart cart) {
        return cartDetailsDao.findByCart(cart);
    }

    @Override
    public void saveCartDetails(CartDetails cartDetails) {
        cartDetailsDao.saveAndFlush(cartDetails);
    }


}
