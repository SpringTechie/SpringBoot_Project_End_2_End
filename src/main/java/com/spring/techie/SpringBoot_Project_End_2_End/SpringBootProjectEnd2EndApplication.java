package com.spring.techie.SpringBoot_Project_End_2_End;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@OpenAPIDefinition(info = @Info(
		title = "SPRING_BOOT_END_2_END_APPLICATION",
		version = "1.0",
		description = "Application API's"
))
public class SpringBootProjectEnd2EndApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootProjectEnd2EndApplication.class, args);
	}

}
