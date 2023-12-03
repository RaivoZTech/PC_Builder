package com.example.PC_Builder.dto;

import com.example.PC_Builder.config.SecurityConfig;
import lombok.Data;

@Data
public class LoginDto {
    private String usernameOrEmail;
    private String password;
}
