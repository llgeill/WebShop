package com.eill.Controller.user;

import com.eill.Pojo.Product;
import com.eill.Pojo.ProductType;
import com.eill.Pojo.ProductVo;
import com.eill.Pojo.User;
import com.eill.Repository.user.UserDao;
import com.eill.Service.product.ProductService;
import com.eill.Service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
public class UserController {

    @Autowired
    private UserDao userdao;
    @Autowired
    private UserService userService;
    @Autowired
    private UserDao userDao;
    @Autowired
    private ProductService productService;

    //首页0
    @RequestMapping(value = "/")
    public String DefaultPage(Model model) throws IOException {
        List<Product> productList = productService.getAllProduct();
        List<ProductType> productTypeList = productService.getAllProductType();
        List<List<Product>> productSuper = new ArrayList<List<Product>>();
        List<ProductVo> productVoList = new ArrayList<>();
        for (int i = 0; i < productTypeList.size(); i++) {
            List<Product> lp = new ArrayList<>();
            ProductType pt = productTypeList.get(i);
            for (int j = 0; j < productList.size(); j++) {
                if (pt.getId().equals(productList.get(j).getProductType().getId())) lp.add(productList.get(j));
            }
            productSuper.add(lp);
        }
        for (int i = 0; i < productSuper.size(); i++) {
            ProductVo pv = new ProductVo();
            pv.setProductType(productTypeList.get(i));
            pv.setProductList(productSuper.get(i));
            productVoList.add(pv);
        }
        model.addAttribute("productVoList", productVoList);
        model.addAttribute("productList", productList);
        return "index";
    }

    @RequestMapping("/updateUser")
    @ResponseBody
    public String UpdateUser (User user) {
        userService.saveUser(user);
        return "Ok";
    }

    /*
   * 登陆界面
   */
    @RequestMapping("/login")
    public String UserLogin(HttpSession session, HttpServletRequest request) {
//        String username=getUsername(request);
//        if(username!=null||username!="")request.getSession().setAttribute("islogin","success");
        return "/login/login";
    }

    /*
   * 退出界面
   */
    @RequestMapping("/logout")
    public String UserLogout(HttpSession session) {
//        session.removeAttribute("islogin");
        return "/logout/logout";
    }

    @RequestMapping("/register")
    public String register() {
//        return "register/register";
        return "register/gmuk";
    }

    @RequestMapping("/registerUser")
    public String registerUser(User user) {
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");
        user.setId(uuid);
        user.setROLE_USER("user");
        user.setIstrue(1);
        userService.registerUser(user);
        return "redirect:/login";
    }

    /*
    * 异步获取登陆权限
    */
    @RequestMapping(value = "/getAdminRole")
    @ResponseBody
    public String getAdminRole(HttpServletRequest request) {
            String authority = "";
            try {
                SecurityContextImpl securityContextImpl = (SecurityContextImpl) request.getSession().getAttribute("SPRING_SECURITY_CONTEXT");
                List<GrantedAuthority> authorities = (List<GrantedAuthority>) securityContextImpl.getAuthentication().getAuthorities();
                 authority=authorities.get(0).getAuthority();
            } catch (Exception ex) {
                authority = "";
            }
            return authority;
        }


    /*
* 异步获取用户名
*/
    @RequestMapping(value = "/getUsername")
    @ResponseBody
    public String getUsername(HttpServletRequest request) {
        String username = "";
        try {
            SecurityContextImpl securityContextImpl = (SecurityContextImpl) request.getSession().getAttribute("SPRING_SECURITY_CONTEXT");
            List<GrantedAuthority> authorities = (List<GrantedAuthority>) securityContextImpl.getAuthentication().getAuthorities();
            String authority=authorities.get(0).getAuthority();
            username = securityContextImpl.getAuthentication().getName();
        } catch (Exception ex) {
            username = "";
        }
        return username;
    }



    /*
    * 异步获取用户名是否重复
    */
    @RequestMapping(value = "/checkUserName")
    @ResponseBody
    public int  checkUserName(HttpServletRequest request, String username){
        User user=userService.checkUserName(username);
        if(user!=null) return 1;
        else return 0;
    }

    /*
* 异步获取用户
*/
    @RequestMapping(value = "/getUser")
    @ResponseBody
    public User getUser(HttpServletRequest request) {
        String name=getUsername(request);
        User user=userService.findByUsernameId(name);
        return user;
    }


}
