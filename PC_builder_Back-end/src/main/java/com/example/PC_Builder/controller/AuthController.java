package com.example.PC_Builder.controller;

import com.example.PC_Builder.entity.Role;
import com.example.PC_Builder.entity.User;
import com.example.PC_Builder.dto.LoginDto;
import com.example.PC_Builder.dto.SignUpDto;
import com.example.PC_Builder.respository.UserRepository;
import com.example.PC_Builder.respository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collections;


import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    // Autowiring necessary components
    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;

    // Endpoint for user sign-in
    @PostMapping("/signin")
    public ResponseEntity<?> authenticateUser(@RequestBody LoginDto loginDto) {
        // Authenticate the user based on username/email and password
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        loginDto.getUsernameOrEmail(),
                        loginDto.getPassword()
                )
        );

        // Set the authentication in the security context
        SecurityContextHolder.getContext().setAuthentication(authentication);

        // Fetch the authenticated user from the database
        User authenticatedUser = userRepository.findByUsernameOrEmail(loginDto.getUsernameOrEmail(), loginDto.getUsernameOrEmail())
                .orElseThrow(() ->
                        new UsernameNotFoundException("User not found with username or email: " + loginDto.getUsernameOrEmail()));

        // Preparing the response
        Map<String, Object> response = new HashMap<>();
        response.put("message", "User signed-in successfully.");
        response.put("username", authenticatedUser.getUsername());
        response.put("userId", authenticatedUser.getId());

        return ResponseEntity.ok(response);
    }

    // Endpoint for user registration
    @PostMapping("/signup")
    public ResponseEntity<?> registerUser(@RequestBody SignUpDto signUpDto) {
        // Check if the username already exists
        if (userRepository.existsByUsername(signUpDto.getUsername())) {
            return ResponseEntity
                    .badRequest()
                    .body(Collections.singletonMap("message", "Username is already taken!"));
        }

        // Check if the email already exists
        if (userRepository.existsByEmail(signUpDto.getEmail())) {
            return ResponseEntity
                    .badRequest()
                    .body(Collections.singletonMap("message", "Email is already taken!"));
        }

        // Create new user's account
        User user = new User();
        user.setName(signUpDto.getName());
        user.setUsername(signUpDto.getUsername());
        user.setEmail(signUpDto.getEmail());
        user.setPassword(passwordEncoder.encode(signUpDto.getPassword()));

        // Assign default role to the user
        Role userRole = roleRepository.findByName("ROLE_USER")
                .orElseThrow(() -> new RuntimeException("Error: Role is not found."));
        user.setRoles(Collections.singleton(userRole));

        // Save the user in the database
        userRepository.save(user);

        return ResponseEntity.ok(Collections.singletonMap("message", "User registered successfully!"));
    }
}

