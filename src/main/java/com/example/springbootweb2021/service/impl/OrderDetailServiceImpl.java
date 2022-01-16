package com.example.springbootweb2021.service.impl;

import com.example.springbootweb2021.entity.OrderDetail;
import com.example.springbootweb2021.mapper.OrderDetailMapper;
import com.example.springbootweb2021.service.OrderDetailService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class OrderDetailServiceImpl extends ServiceImpl<OrderDetailMapper, OrderDetail> implements OrderDetailService {

}
