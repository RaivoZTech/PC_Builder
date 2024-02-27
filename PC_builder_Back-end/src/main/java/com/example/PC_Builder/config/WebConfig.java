package com.example.PC_Builder.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    // Override the addCorsMappings method to configure Cross-Origin Resource Sharing (CORS) settings
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/api/**") // Apply CORS settings to all routes under '/api/'
                .allowedOrigins("http://localhost:3000") // Allow CORS requests from the specified origin
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS") // Specify the HTTP methods allowed for CORS requests
                .allowedHeaders("*") // Allow all headers in CORS requests
                .allowCredentials(true); // Allow credentials in CORS requests
    }
}
