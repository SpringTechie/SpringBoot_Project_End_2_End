package com.spring.techie.SpringBoot_Project_End_2_End.service;


import com.spring.techie.SpringBoot_Project_End_2_End.model.User;

public interface UserService {

    User saveUser(User user);
    User getUser(int id);
}
