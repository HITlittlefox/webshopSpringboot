package com.example.springbootweb2021.service;

import com.example.springbootweb2021.entity.Cart;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.springbootweb2021.vo.CartVO;

import java.util.List;

public interface CartService extends IService<Cart> {
    public List<CartVO> findAllCartVOByUserId(Integer id);
}
