package com.example.PC_Builder.entity;
import com.example.PC_Builder.entity.Components;
import lombok.*;
import jakarta.persistence.*;


import java.util.List;

@Entity
@Table(name = "pc_builds")
public class PCBuild {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; // Primary key for the PC build

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToMany
    @JoinTable(
            name = "pcbuild_components",
            joinColumns = @JoinColumn(name = "pcbuild_id"),
            inverseJoinColumns = @JoinColumn(name = "component_id"))
    private List<Components> components; // List of components associated with build.

    private String imageUrl; // Field for storing image URL of the build

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Components> getComponents() {
        return components;
    }

    public void setComponents(List<Components> components) {
        this.components = components;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

}