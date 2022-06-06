package com.rnganzhuk.spring_flyway_local.controller;

import com.rnganzhuk.spring_flyway_local.entity.User;
import com.rnganzhuk.spring_flyway_local.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;

@RestController
public class UserController {

    @Autowired
    UserService userService;

    @GetMapping(path = "/user/{id}")
    public @ResponseBody Optional<User> getUser(@PathVariable(value = "id") int id){
        return userService.getUser(id);
    }
}
