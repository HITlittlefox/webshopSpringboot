package com.example.springbootweb2021.service.impl;

import com.example.springbootweb2021.mapper.UserAddressMapper;
import com.example.springbootweb2021.entity.UserAddress;
import com.example.springbootweb2021.service.UserAddressService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class UserAddressServiceImpl extends ServiceImpl<UserAddressMapper, UserAddress> implements UserAddressService {

}
