package com.eill.Controller.cart;

import com.eill.Pojo.*;
import com.eill.Service.cart.CartService;
import com.eill.Service.order.OrderService;
import com.eill.Service.product.ProductService;
import com.eill.Service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
public class CartController {
    @Autowired
    private ProductService productService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private UserService userService;
    @Autowired
    private CartService cartService;

    public String getUsername(HttpServletRequest request){
        String username="";
        try{
            SecurityContextImpl securityContextImpl = (SecurityContextImpl) request.getSession().getAttribute("SPRING_SECURITY_CONTEXT");
            username = securityContextImpl.getAuthentication().getName();
        }catch (Exception ex){
            username="";
            return username;
        };
        return username;
    }

    @RequestMapping("/llg/cart")
    public String cart(Model model,HttpServletRequest request){
        String username=getUsername(request);
        User user=userService.findByUsernameId(username);
        Cart cart=cartService.findCartByUser(user);
        List<CartDetails> list=cartService.getAllproduce(cart);
        List<CartDetailsVo> voList=new ArrayList<>();
        for(CartDetails cartDetails:list){
            CartDetailsVo cv=new CartDetailsVo();
            int count=cartDetails.getProductCount();
            double price;
            if(cartDetails.getProductCount()>cartDetails.getProduct().getProductDetails().getTwoCount())
                price=cartDetails.getProduct().getProductDetails().getTwoPrice();
            else price=cartDetails.getProduct().getProductDetails().getOnePrice();
            BigDecimal bigDecimal=BigDecimal.valueOf(price);
            BigDecimal bigDecimal1=BigDecimal.valueOf(count);
            BigDecimal bigDecimal2=bigDecimal.multiply(bigDecimal1);
            cv.setPrice(price);
            cv.setAllPrice(bigDecimal2);
            cv.setCart(cartDetails.getCart());
            cv.setId(cartDetails.getId());
            cv.setProduct(cartDetails.getProduct());
            cv.setProductCount(cartDetails.getProductCount());
            voList.add(cv);
        }
        model.addAttribute("voList",voList);
        return "cart/cart";
    }

    @RequestMapping("/llg/updateProduceCount")
    public void updateProduceCount(String value, String id, HttpServletRequest request){
        String username=getUsername(request);
        int productCount=Integer.parseInt(value);
        User user=userService.findByUsernameId(username);
        Cart cart=cartService.findCartByUser(user);
        String cartId=cart.getId();
        cartService.updateProduceCount(productCount,id,cartId);
    }

    @RequestMapping("/addProduct")
    @ResponseBody
    public String addProduct( String id,String quantity,HttpServletRequest request){
        //用户购物车，有则改无则增
        Cart cart=null;
        Product product=null;
        int oldCount=0;
        boolean isExitProduct=false;
        String uuid= UUID.randomUUID().toString().replaceAll("-","");
        String username=getUsername(request);
        int productCount=Integer.parseInt(quantity);
        User user=userService.findByUsernameId(username);
        cart=cartService.findCartByUser(user);
        if(cart==null){
            cart=new Cart();
            cart.setId(uuid);
            cart.setUser(user);
           cartService.saveCart(cart);
        }
        String cartId=cart.getId();
        product= productService.getProductById(id);
        List<CartDetails> cartDetailsList=cartService.getCartDetailsById(cart);
       for(CartDetails cartDetails:cartDetailsList){
           Product cartProduct=cartDetails.getProduct();
           if(cartProduct.getId().equals(product.getId())){
               isExitProduct=true;
               oldCount=cartDetails.getProductCount();
               break;
           }
       }
       if(isExitProduct) {
           cartService.updateProduceCount(productCount+oldCount,id,cartId);
       }
       else{
            CartDetails cartDetails=new CartDetails();
            cartDetails.setCart(cart);
            cartDetails.setProduct(product);
            cartDetails.setProductCount(productCount);
           cartService.saveCartDetails(cartDetails);
       }
        return "success";
    }

    @RequestMapping("/finshByeAndPay")
    @ResponseBody
    public String finshByeAndPay(Model model,String id,String quantity,HttpServletRequest request){
        addProduct(id,quantity,request);

       return "success";
    }





}
