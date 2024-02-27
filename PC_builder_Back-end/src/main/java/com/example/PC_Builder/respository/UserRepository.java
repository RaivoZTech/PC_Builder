package com.example.PC_Builder.respository;

import com.example.PC_Builder.entity.User;
import org.springframework.data.domain.Example;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User,Long>{
    // Method to find a user by their email.
    Optional<User> findByEmail(String email);

    // Method to find a user either by their username or email.
    Optional<User> findByUsernameOrEmail(String username, String email);

    // Method to find a user by their username.
    Optional<User> findByUsername(String username);

    // Method to check if a username exists in the database.
    Boolean existsByUsername(String username);

    // Method to check if an email exists in the database.
    Boolean existsByEmail(String email);
}
