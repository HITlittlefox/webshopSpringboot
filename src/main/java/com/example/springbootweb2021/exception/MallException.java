package com.example.springbootweb2021.exception;

import com.example.springbootweb2021.enums.ResultEnum;


public class MallException extends RuntimeException {
    public MallException(String error) {
        super(error);
    }

    public MallException(ResultEnum resultEnum) {
        super(resultEnum.getMsg());
    }
}
