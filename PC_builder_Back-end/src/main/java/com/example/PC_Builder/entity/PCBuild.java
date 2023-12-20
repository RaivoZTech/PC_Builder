package com.example.PC_Builder.entity;
import com.example.PC_Builder.entity.Components;
import lombok.Data;
import jakarta.persistence.*;


import java.util.List;

@Entity
@Table(name = "pc_builds")
public class PCBuild {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToMany
    @JoinTable(
            name = "pcbuild_components",
            joinColumns = @JoinColumn(name = "pcbuild_id"),
            inverseJoinColumns = @JoinColumn(name = "component_id"))
    private List<Components> components;
}
