package com.spring.techie.SpringBoot_Project_End_2_End.controller;


import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

@RestController
@Tag(name="User Controller")
public class UserController {


//    private final UserServiceImpl userServiceImpl;
//
//    @Autowired
//    public UserController(UserServiceImpl userServiceImpl) {
//        this.userServiceImpl = userServiceImpl;
//    }
//
//    @PostMapping("/save")
//    @Operation(description = "To create new User",summary = "save new User")
//    @Parameter(name = "User",description = "User Info")
//    @ApiResponse(responseCode = "201", description = "returns 201  user save successfully into DB")
//    public User saveUser(@RequestBody User user) {
//       return userServiceImpl.saveUser(user);
//    }
//    @GetMapping("/get/id/{id}")
//    @Operation(description = "To Fetch User Based on Id",summary = "Find User")
//    @Parameter(name = "id",description = "User Id",example = "1")
//    @ApiResponse(responseCode = "200", description = "returns 200 if user fetched successfully from DB")
//    public User getUser(@PathVariable("id") int id) {
//        return userServiceImpl.getUser(id);
//    }

    @GetMapping("/welcome")
    public String getUser() {
        return "Hello Welcome";
    }



}
