package com.eill.Controller.product;


import com.eill.Pojo.Product;
import com.eill.Pojo.ProductType;
import com.eill.Pojo.ProductVo;
import com.eill.Service.product.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.kafka.KafkaProperties;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
public class productController {
    @Autowired
    private ProductService productService;


    @RequestMapping("/ProductShow")
    public String showProduct(Model model){
        List<Product> productList=productService.getAllProduct();
        List<ProductType> productTypeList=productService.getAllProductType();
        List<List<Product>> productSuper=new ArrayList<List<Product>>();
        List<ProductVo> productVoList=new ArrayList<>();
        for(int i=0;i<productTypeList.size();i++){
            List<Product> lp=new ArrayList<>();
            ProductType pt=productTypeList.get(i);
            for(int j=0;j<productList.size();j++){
                if(pt.getId().equals(productList.get(j).getProductType().getId()))lp.add(productList.get(j));
            }
            productSuper.add(lp);
        }

        for(int i=0;i<productSuper.size();i++){
            ProductVo pv=new ProductVo();
            pv.setProductType(productTypeList.get(i));
            pv.setProductList(productSuper.get(i));
            productVoList.add(pv);
        }
        model.addAttribute("productVoList",productVoList);
        return "/product/ProductShowss";
    }

    @RequestMapping("/ProductDetailsShow")
    public String showProductDetails(Model model,String id){
        Product product=productService.getProductById(id);
        model.addAttribute("product",product);
        return "/product/test";
    }

    @RequestMapping("/getProductById")
    @ResponseBody
    public Product getProductById(String id){
        Product product=productService.getProductById(id);
        return product;
    }



}
