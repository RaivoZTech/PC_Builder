package com.example.PC_Builder.respository;

import com.example.PC_Builder.entity.Components;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ComponentRepository extends JpaRepository<Components, Long> {
    // Custom method to find Components by their type
    List<Components> findByType(String type);

    // Custom method to find Components by a list of IDs
    List<Components> findByIdIn(List<Long> ids);
}
