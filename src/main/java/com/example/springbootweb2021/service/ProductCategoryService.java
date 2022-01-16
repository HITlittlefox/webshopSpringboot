package com.example.springbootweb2021.service;

import com.example.springbootweb2021.entity.ProductCategory;
import com.example.springbootweb2021.vo.ProductCategoryVO;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface ProductCategoryService extends IService<ProductCategory> {
    public List<ProductCategoryVO> getAllProductCategoryVO();
}
