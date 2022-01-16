package com.example.springbootweb2021.service;

import com.example.springbootweb2021.entity.Product;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.springbootweb2021.vo.TableDataVO;
import com.example.springbootweb2021.vo.TableProductVO;

import java.util.List;

public interface ProductService extends IService<Product> {
    public List<Product> findByCategoryId(String type, Integer categoryId);

    //后台管理系统返回商品数据
    public TableDataVO<TableProductVO> findAllTableData(Integer page, Integer limit);
}
