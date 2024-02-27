package com.example.PC_Builder.entity;


import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "components")
public class Components {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; // Primary key for the component

    private String type; // Type of the component (e.g., CPU, GPU)

    private String name; // Name of the component

    @Column(columnDefinition = "TEXT")
    private String specs; // Detailed specifications of the component, stored as text

    private Double price; // Price of the component
}


