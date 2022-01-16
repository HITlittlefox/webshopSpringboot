package com.example.springbootweb2021.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.springbootweb2021.service.CartService;
import com.example.springbootweb2021.service.ProductService;
import com.example.springbootweb2021.entity.User;
import com.example.springbootweb2021.service.ProductCategoryService;
import com.example.springbootweb2021.vo.TableDataVO;
import com.example.springbootweb2021.vo.TableProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;


@Controller
@RequestMapping("/product")
public class ProductsController {

    @Autowired
    private ProductService productService;
    @Autowired
    private ProductCategoryService productCategoryService;
    @Autowired
    private CartService cartService;

    @GetMapping("/list/{type}/{id}")
    public ModelAndView list(
            @PathVariable("type") String type,
            @PathVariable("id") Integer id,
            HttpSession session
    ) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("productList");
        modelAndView.addObject("productList", productService.findByCategoryId(type, id));
        modelAndView.addObject("list", productCategoryService.getAllProductCategoryVO());
        User user = (User) session.getAttribute("user");
        if (user == null) {
            modelAndView.addObject("cartList", new ArrayList<>());
        } else {
            modelAndView.addObject("cartList", cartService.findAllCartVOByUserId(user.getId()));
        }
        return modelAndView;
    }

    @PostMapping("/findByKey")
    public ModelAndView findByKey(String keyWord, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("productList");
        //根据关键字查询
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.like("name", keyWord);
        modelAndView.addObject("productList", productService.list(wrapper));
        modelAndView.addObject("list", productCategoryService.getAllProductCategoryVO());
        User user = (User) session.getAttribute("user");
        if (user == null) {
            modelAndView.addObject("cartList", new ArrayList<>());
        } else {
            modelAndView.addObject("cartList", cartService.findAllCartVOByUserId(user.getId()));
        }
        return modelAndView;
    }

    @GetMapping("/findById/{id}")
    public ModelAndView findById(@PathVariable("id") Integer id, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("productDetail");
        modelAndView.addObject("product", productService.getById(id));
        modelAndView.addObject("list", productCategoryService.getAllProductCategoryVO());
        User user = (User) session.getAttribute("user");
        if (user == null) {
            modelAndView.addObject("cartList", new ArrayList<>());
        } else {
            modelAndView.addObject("cartList", cartService.findAllCartVOByUserId(user.getId()));
        }
        return modelAndView;
    }

    @RequestMapping("/findAllTableProduct")
    @ResponseBody
    public TableDataVO<TableProductVO> findAllTableProduct(Integer page, Integer limit) {
        return productService.findAllTableData(page, limit);
    }
}

