package com.example.springbootweb2021;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

//@SpringBootApplication(exclude= {DataSourceAutoConfiguration.class})
@SpringBootApplication
@MapperScan("com.example.springbootweb2021.mapper")
public class Mmall002Application {

    public static void main(String[] args) {
        SpringApplication.run(Mmall002Application.class, args);
    }

}
