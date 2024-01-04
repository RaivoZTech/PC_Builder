package com.example.PC_Builder.respository;

import com.example.PC_Builder.entity.Components;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ComponentRepository extends JpaRepository<Components, Long> {
    List<Components> findByType(String type);
    List<Components> findByIdIn(List<Long> ids);
}