package com.example.PC_Builder.entity;
import lombok.Getter;
import lombok.Setter;

import jakarta.persistence.*;

@Setter
@Getter
@Entity
@Table(name = "roles")
public class Role {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id; // Primary key for the role

    @Column(length = 60)
    private String name; // Name of the role
}