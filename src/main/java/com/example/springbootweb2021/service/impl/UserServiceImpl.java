package com.example.springbootweb2021.service.impl;

import com.example.springbootweb2021.mapper.UserMapper;
import com.example.springbootweb2021.service.UserService;
import com.example.springbootweb2021.entity.User;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

}
