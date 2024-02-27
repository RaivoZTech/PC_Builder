package com.example.PC_Builder.respository;

import com.example.PC_Builder.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface RoleRepository extends JpaRepository<Role, Long> {
    // Custom method to find a Role by its name
    Optional<Role> findByName(String name);
}

