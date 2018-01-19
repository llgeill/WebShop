package com.eill.Controller.admin;

import com.eill.Pojo.Orders;
import com.eill.Pojo.Product;
import com.eill.Pojo.ProductType;
import com.eill.Pojo.ProductVo;
import com.eill.Repository.product.ProductDao;
import com.eill.Repository.product.ProductTypeDao;
import com.eill.Service.order.OrderService;
import com.eill.Service.product.ProductService;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ClassUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;

@Controller
public class AdminController {
    @Autowired
    private ProductService productService;
    @Autowired
    private OrderService orderService;





    @RequestMapping("/admin/admin")
    public String adminIndex(Model model){
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
        model.addAttribute("productList",productList);
        return "/admin/AdminPage";
    }

    @RequestMapping("/getAllProduct")
    @ResponseBody
    public List<Product> getAllProduct(){
        List<Product> list=productService.getAllProduct();
        return  list;
    }

    @RequestMapping("/upload")
    @ResponseBody
    public void upload( MultipartFile file, HttpServletRequest request, Product product) throws IOException {
        //获取类型的map,得到相对应的文件夹名称
        Map<String,String> map=new HashMap<>();
        List<ProductType> productTypeList=productService.findAllProductType();
        for(ProductType p:productTypeList){
            map.put(p.getId(),p.getEname());
        }
        //判断文件夹是否为空
        if(!file.getOriginalFilename().equals("")){
            String thisPath=this.getClass().getResource("/").getPath();
            String nowPath=thisPath.substring(thisPath.indexOf("/"),thisPath.indexOf("/MyProject"));
            String uuid= UUID.randomUUID().toString().replaceAll("-","");
            //创建图片
            String filename=uuid+".jpg";
            String dirpath=map.get(product.getProductType().getId());
            String resultPath=nowPath+"/MyProject/src/main/resources/static/image/"+dirpath+"/"+filename;
            String tempPath=thisPath+"static/image/"+dirpath+"/"+filename;
            File file1=new File(resultPath);//项目文件
            File file2=new File(tempPath);//class文件
            //写入图片并且关闭输出流
            FileOutputStream fileOutputStream=new FileOutputStream(file1);
            FileOutputStream fileOutputStream2=new FileOutputStream(file2);
            fileOutputStream.write(file.getBytes());
            fileOutputStream2.write(file.getBytes());
            fileOutputStream.close();
            fileOutputStream2.close();
            //判断是修改数据还是增加数据
            if(product.getId().equals("")&&product.getProductDetails().getProductImage().equals("")){
                String newProductId= UUID.randomUUID().toString().replaceAll("-","");
                product.setId(newProductId);
                String newProductDetailsId= UUID.randomUUID().toString().replaceAll("-","");
                product.getProductDetails().setId(newProductDetailsId);
                product.getProductDetails().setIsCarousel(0);
                product.getProductDetails().setIsMonth(0);
                product.getProductDetails().setIsWeek(0);
                product.getProductDetails().setIsYear(0);
            }else{
                //删除旧图片
                Product oldPorduct=productService.getProductById(product.getId());
                File file3=new File(nowPath+"/MyProject/src/main/resources/static"+oldPorduct.getProductDetails().getProductImage());
                File file4=new File(thisPath+"/static"+oldPorduct.getProductDetails().getProductImage());
                file3.getAbsoluteFile().delete();
                file4.getAbsoluteFile().delete();
            }
            product.getProductDetails().setProductImage("/image/"+dirpath+"/"+filename);
        }
        productService.saveProduct(product);

    }

    @RequestMapping("/deleateProductById")
    @ResponseBody
    public String  deleateProductById(String id){

        Product oldPorduct=productService.getProductById(id);
        String thisPath=this.getClass().getResource("/").getPath();
        String nowPath=thisPath.substring(thisPath.indexOf("/"),thisPath.indexOf("/MyProject"));
        File file3=new File(nowPath+"/MyProject/src/main/resources/static"+oldPorduct.getProductDetails().getProductImage());
        File file4=new File(thisPath+"/static"+oldPorduct.getProductDetails().getProductImage());
        file3.getAbsoluteFile().delete();
        file4.getAbsoluteFile().delete();
        String productTypeId=oldPorduct.getProductType().getId();
        productService.deleateProductById(id);
        return productTypeId;
    }

    @RequestMapping("/saveProduct")
    @ResponseBody
    public void saveProduct(Product product){
        productService.saveProduct(product);
    }

    @RequestMapping("/updateCarousel")
    @ResponseBody
    public void updateCarousel(String newProductId,String oldProductId ){
        Product newproduct=productService.getProductById(newProductId);
        if(newproduct.getProductDetails().getIsCarousel()!=1){
            Product oldproduct=productService.getProductById(oldProductId);
            oldproduct.getProductDetails().setIsCarousel(0);
            newproduct.getProductDetails().setIsCarousel(1);
            productService.saveProduct(newproduct);
            productService.saveProduct(oldproduct);
        }

    }

    @RequestMapping("/updateYear")
    @ResponseBody
    public void updateYear(String newProductId,String oldProductId ){
        Product newproduct=productService.getProductById(newProductId);
        if(newproduct.getProductDetails().getIsYear()!=1){
            Product oldproduct=productService.getProductById(oldProductId);
            oldproduct.getProductDetails().setIsYear(0);
            newproduct.getProductDetails().setIsYear(1);
            productService.saveProduct(newproduct);
            productService.saveProduct(oldproduct);
        }
    }

    @RequestMapping("/updateMonth")
    @ResponseBody
    public void updateMonth(String newProductId,String oldProductId ){
        Product newproduct=productService.getProductById(newProductId);
        if(newproduct.getProductDetails().getIsMonth()!=1){
            Product oldproduct=productService.getProductById(oldProductId);
            oldproduct.getProductDetails().setIsMonth(0);
            newproduct.getProductDetails().setIsMonth(1);
            productService.saveProduct(newproduct);
            productService.saveProduct(oldproduct);
        }

    }

    @RequestMapping("/updateWeek")
    @ResponseBody
    public void updateWeek(String newProductId,String oldProductId ){
        Product newproduct = productService.getProductById(newProductId);
        if(newproduct.getProductDetails().getIsWeek()!=1) {
            Product oldproduct=productService.getProductById(oldProductId);
            oldproduct.getProductDetails().setIsWeek(0);
            newproduct.getProductDetails().setIsWeek(1);
            productService.saveProduct(newproduct);
            productService.saveProduct(oldproduct);
        }
    }

    @RequestMapping("/admin/allOrders")
    public String allOrders(){
        return "/admin/AllOrders";
    }

    @RequestMapping("/getAllOrders")
    @ResponseBody
    public Page<Orders> getAllOrders(int page,int size){
        Page<Orders> ps=orderService.findAll(page-1,size);
        return ps;
    }
}
