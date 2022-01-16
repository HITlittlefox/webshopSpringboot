package com.example.springbootweb2021.vo;

import lombok.Data;

@Data
public class TableProductVO {
    private Integer id;
    private String name;
    private String description;
    private Float price;
    private Integer stock;
    private String levelOne;
    private String levelTwo;
    private String levelThree;
    private String fileName;
}
