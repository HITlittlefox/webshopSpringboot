package com.example.springbootweb2021.enums;

import lombok.Getter;

// 库存枚举对比
@Getter
public enum ResultEnum {
    STOCK_ERROR(1, "库存不足");

    private Integer code;
    private String msg;

    ResultEnum(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}
