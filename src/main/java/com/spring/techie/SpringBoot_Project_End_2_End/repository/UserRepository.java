package com.spring.techie.SpringBoot_Project_End_2_End.repository;

import com.spring.techie.SpringBoot_Project_End_2_End.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User,Integer> {
}
