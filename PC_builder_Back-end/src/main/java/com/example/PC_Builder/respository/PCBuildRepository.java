package com.example.PC_Builder.respository;

import com.example.PC_Builder.entity.PCBuild;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PCBuildRepository extends JpaRepository<PCBuild, Long> {
    // Custom method to find PCBuilds by the user ID
    List<PCBuild> findByUserId(Long userId);
}
