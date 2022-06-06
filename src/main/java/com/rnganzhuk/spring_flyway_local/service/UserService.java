package com.rnganzhuk.spring_flyway_local.service;

import com.rnganzhuk.spring_flyway_local.entity.User;
import com.rnganzhuk.spring_flyway_local.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService {

    @Autowired
    UserRepository userRepository;

    public Optional<User> getUser(int id){
        return userRepository.findById(id);
    }
}
