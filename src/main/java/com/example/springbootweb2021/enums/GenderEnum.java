package com.example.springbootweb2021.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

// 性别枚举对应
@Getter
public enum GenderEnum {
    WOMAN(0, "女"),
    MAN(1, "男");

    @EnumValue
    private Integer code;
    private String value;

    GenderEnum(Integer code, String value) {
        this.code = code;
        this.value = value;
    }
}
