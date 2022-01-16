package com.example.springbootweb2021.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.springbootweb2021.service.CartService;
import com.example.springbootweb2021.service.UserService;
import com.example.springbootweb2021.entity.User;
import com.example.springbootweb2021.enums.GenderEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UsersController {

    @Autowired
    private UserService userService;
    @Autowired
    private CartService cartService;

    @PostMapping("/register")
    public String register(User user, Model model) {
        boolean result = false;
        try {
            if (user.getGenderCode() == 1) {
                user.setGender(GenderEnum.MAN);
            }
            if (user.getGenderCode() == 0) {
                user.setGender(GenderEnum.WOMAN);
            }
            result = userService.save(user);
        } catch (Exception e) {
            model.addAttribute("error", user.getLoginName() + "已存在！请重新输入！");
            return "register";
        }
        if (result) return "login";
        return "register";
    }

    /**
     * 登录
     *
     * @param loginName
     * @param password
     * @param session
     * @return
     */
    @PostMapping("/login")
    public String login(String loginName, String password, HttpSession session) {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("login_name", loginName);
        wrapper.eq("password", password);
        User user = userService.getOne(wrapper);
        if (user == null) {
            return "login";
        } else {
            session.setAttribute("user", user);
            return "redirect:/productCategory/list";
        }
    }

    /**
     * 退出
     *
     * @param session
     * @return
     */
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "login";
    }

    /**
     * 用户信息
     */
    @GetMapping("/userInfo")
    public ModelAndView userInfo(HttpSession session) {
        User user = (User) session.getAttribute("user");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("userInfo");
        modelAndView.addObject("cartList", cartService.findAllCartVOByUserId(user.getId()));
        return modelAndView;
    }
}

