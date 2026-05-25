package dev.blackpawn.hemocareapi;

import org.springframework.boot.SpringApplication;

public class TestHemocareapiApplication {

	public static void main(String[] args) {
		SpringApplication.from(HemocareapiApplication::main).with(TestcontainersConfiguration.class).run(args);
	}

}
