package com.eill.Controller.order;

import com.eill.Pojo.*;
import com.eill.Service.cart.CartService;
import com.eill.Service.order.OrderService;
import com.eill.Service.product.ProductService;
import com.eill.Service.user.UserService;
import com.sun.deploy.net.HttpResponse;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.logging.SimpleFormatter;

@Controller
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private UserService userService;
    @Autowired
    private CartService cartService;
    @Autowired
    private ProductService productService;
    public String getUsername(HttpServletRequest request){
        SecurityContextImpl securityContextImpl = (SecurityContextImpl) request.getSession().getAttribute("SPRING_SECURITY_CONTEXT");
        String username="";
        try{
            username = securityContextImpl.getAuthentication().getName();
        }catch (Exception ex){
            username="";
            return username;
        };
        return username;
    }


    @RequestMapping("/insertOrderAndDetails")
    public String insertOrderAndDetails(Model model, HttpServletRequest request, Orders ods, User us, HttpServletResponse response) throws ParseException {
        String productId[]= (String[]) request.getSession().getAttribute("productId");
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");
        Orders order=new Orders();
        order.setId(uuid);
        order.setStatue(1);
        if(ods.getPostCode()!=null) order.setPostCode(ods.getPostCode());
        if(ods.getRemark()!=null)order.setRemark(ods.getRemark());
        User user=userService.findByUsernameId(getUsername(request));
        order.setUser(user);
        Cart cart=cartService.findCartByUser(user);
        if(cart==null) return "redirect:/llg/repeatsubmit";
        orderService.insertOrder(order);
        List<CartDetails> cartDetailsList=cartService.findAllByCart(cart);
        List<CartDetails> buyList=new ArrayList<>();
        for(CartDetails cartDetails:cartDetailsList){
            for(String proid : productId){
                if(cartDetails.getProduct().getId().equals(proid))buyList.add(cartDetails);
            }
        }
        for(CartDetails cd:buyList){
            OrdersDetails od=new OrdersDetails();
            od.setOrders(order);
            od.setProduct(cd.getProduct());
            od.setProductCount(cd.getProductCount());
            orderService.insertOrderDetails(od);
            //修改商品库存
            Product product=cd.getProduct();
            int oldstock=product.getProductDetails().getStock();
            int newstock=oldstock-cd.getProductCount();
            productService.updateStock(newstock,product.getProductDetails().getId());
            //修改结束
            //修改商品销量
            int oldSaleCount=product.getProductDetails().getSalesCount();
            int newSaleCount=oldSaleCount+cd.getProductCount();
            productService.updateSalesCount(newSaleCount,product.getProductDetails().getId());
            //修改结束
            cartService.deleateCartDetails(cd);
        }
        if(us.getPhonenumber()!=null||us.getPhonenumber().trim()!=""){
            user.setPhonenumber(us.getPhonenumber());
        }
        if(us.getAddress()!=null||us.getAddress().trim()!=""){
            user.setAddress(us.getAddress());
        }
        userService.updateUser(user.getPhonenumber(),user.getAddress(),user.getId());
        Orders thisorder=orderService.findOneById(order.getId()) ;
        Date date=thisorder.getCreateDate();
        String mydate= new SimpleDateFormat("yyyy MM dd  HH mm ss").format(date);
        model.addAttribute("user",user);
        model.addAttribute("order",thisorder);
        model.addAttribute("mydate",mydate);
        request.getSession().removeAttribute("productId");
        return "redirect:/successSkip";
    }

    @RequestMapping("/successSkip")
    public String success(Model model,HttpServletRequest request){
        User user=userService.findByUsernameId(getUsername(request));
        Orders thisorder=orderService.findFirst();
        Date date=thisorder.getCreateDate();
        String mydate= new SimpleDateFormat("yyyy MM dd  HH mm ss").format(date);
        model.addAttribute("user",user);
        model.addAttribute("order",thisorder);
        model.addAttribute("mydate",mydate);
        return "/order/orderSuccess";
    }

    @RequestMapping("/skipToPay")
    public String skipToPay(Model model, HttpServletRequest request,String quantity,String ids){
        //需要购买的商品id
        String productId[]= productId=ids.split(",");
        //将商品id放入到session中
        request.getSession().setAttribute("productId",productId);
        String username=getUsername(request);
        String uuid=UUID.randomUUID().toString().replaceAll("-","");
        User user=userService.findByUsernameId(username);
        Cart cart=cartService.findCartByUser(user);
        if(cart==null){
            cart=new Cart();
            cart.setId(uuid);
            cart.setUser(user);
            cartService.saveCart(cart);
            CartDetails cartDetails=new CartDetails();
            cartDetails.setProduct(productService.getProductById(productId[0]));
            cartDetails.setProductCount(Integer.parseInt(quantity));
            cartDetails.setCart(cart);
            cartService.saveCartDetails(cartDetails);
        }
        List<CartDetails> list=cartService.getAllproduce(cart);
        List<CartDetails> buyList=new ArrayList<>();
        for(CartDetails cartDetails:list){
            for(String proid : productId){
                if(cartDetails.getProduct().getId().equals(proid))buyList.add(cartDetails);
            }
        }
        List<CartDetailsVo> voList=new ArrayList<>();
        for(CartDetails cartDetails:buyList){
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
        model.addAttribute("user",user);
        model.addAttribute("cart",cart);
        return "/order/order";
    }

//    @RequestMapping("/skipToPaySuper")
//    public String skipToPaySuper(Model model, HttpServletRequest request,String id,String quantity){
//        String username=getUsername(request);
//        String uuid=UUID.randomUUID().toString().replaceAll("-","");
//        User user=userService.findByUsernameId(username);
//        Cart cart=new Cart();
//        cart.setId(uuid);
//        cart.setUser(user);
//        CartDetails cartDetails=new CartDetails();
//        cartDetails.setCart(cart);
//        cartDetails.setProductCount(Integer.parseInt(quantity));
//        cartDetails.setProduct(productService.getProductById(id));
//        return "forword:/order/order";
//    }

    @RequestMapping("/llg/showOrder")
    public String showOrder(HttpServletRequest request){
        User user=userService.findByUsernameId(getUsername(request));
        orderService.findAllOrderByUser(user);
        return "/order/showOrder";
    }

    @RequestMapping("/llg/showOrderDetails")
    public String showOrderDetails(Model model, HttpServletRequest request){
        List<OrdersDetailsVo> ordersDetailsVoList=new ArrayList<>();
        User user=userService.findByUsernameId(getUsername(request));
        List<Orders> ordersList=orderService.findAllOrderByUser(user);
        for(Orders od :ordersList){
            List<OrdersDetails> ordersDetailsList=orderService.findAllByOrder(od);
            OrdersDetailsVo ordersDetailsVo=new OrdersDetailsVo();
            ordersDetailsVo.setUser(user);
            ordersDetailsVo.setOrders(od);
            ordersDetailsVo.setOrdersDetailsList(ordersDetailsList);
            ordersDetailsVoList.add(ordersDetailsVo);
            BigDecimal allprice=BigDecimal.valueOf(0);
            for(OrdersDetails ods :ordersDetailsList){
                BigDecimal bigDecimal=BigDecimal.valueOf(ods.getProduct().getProductDetails().getOnePrice());
                BigDecimal bigDecimal1=BigDecimal.valueOf(ods.getProductCount());
                BigDecimal bigDecimal2=bigDecimal.multiply(bigDecimal1);
                allprice=allprice.add(bigDecimal2);
            }
            ordersDetailsVo.setAllprice(allprice);
        }
        model.addAttribute("ordersDetailsVoList",ordersDetailsVoList);
        return "order/orderDetails";
    }



    @RequestMapping("/llg/repeatsubmit")
    public String repeatsubmit(){
        return "repeatsubmit";
    }


}
