package com.example.springbootweb2021.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;

    //主键
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    //名称
    private String name;

    //描述
    private String description;

    //价格
    private Float price;

    private Integer stock;

    //分类1
    private Integer categoryleveloneId;

    //分类2
    private Integer categoryleveltwoId;

    //分类3
    private Integer categorylevelthreeId;

    //文件名称
    private String fileName;


}
