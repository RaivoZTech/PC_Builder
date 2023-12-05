package com.example.PC_Builder.entity;


import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "components")
public class Components {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String type;
    private String name;

    @Column(columnDefinition = "TEXT")
    private String specs;
    private Double price;
}
