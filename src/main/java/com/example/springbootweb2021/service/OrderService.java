package com.example.springbootweb2021.service;

import com.example.springbootweb2021.entity.Orders;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.springbootweb2021.entity.User;
import com.example.springbootweb2021.vo.OrderVO;

import java.util.List;

public interface OrderService extends IService<Orders> {
    public boolean save(Orders orders, User user, String address, String remark);

    public List<OrderVO> findAllOrederVOByUserId(Integer id);
}
