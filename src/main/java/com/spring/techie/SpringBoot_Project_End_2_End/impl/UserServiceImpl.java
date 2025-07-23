package com.spring.techie.SpringBoot_Project_End_2_End.impl;

import com.spring.techie.SpringBoot_Project_End_2_End.model.User;
import com.spring.techie.SpringBoot_Project_End_2_End.repository.UserRepository;
import com.spring.techie.SpringBoot_Project_End_2_End.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;

    @Autowired
    public UserServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public User saveUser(User user) {
        return userRepository.save(user);
    }

    @Override
    public User getUser(int id) {
        return userRepository.findById(id).orElse(null);
    }
}
