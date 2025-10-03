package com.pikeproject.springboottest;

import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

@SpringBootApplication
@ComponentScan(basePackages = "com.pikeproject.springboottest")
public class SpringboottestApplication {
    @Autowired
    private ApplicationContext applicationContext;

    @PostConstruct
    public void logEndpoints() {
        RequestMappingHandlerMapping mapping = applicationContext.getBean(RequestMappingHandlerMapping.class);
        mapping.getHandlerMethods().forEach((key, value) -> System.out.println(key + " => " + value));
    }

	public static void main(String[] args) {
        SpringApplication.run(SpringboottestApplication.class, args);
	}
}
