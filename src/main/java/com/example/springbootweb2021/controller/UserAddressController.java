package com.example.springbootweb2021.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.springbootweb2021.service.CartService;
import com.example.springbootweb2021.service.UserAddressService;
import com.example.springbootweb2021.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/userAddress")
public class UserAddressController {

    @Autowired
    private UserAddressService userAddressService;
    @Autowired
    private CartService cartService;

    @GetMapping("/list")
    public ModelAndView list(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("userAddressList");
        User user = (User) session.getAttribute("user");
        modelAndView.addObject("cartList", cartService.findAllCartVOByUserId(user.getId()));
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("user_id", user.getId());
        modelAndView.addObject("addressList", userAddressService.list(wrapper));
        return modelAndView;
    }
}

