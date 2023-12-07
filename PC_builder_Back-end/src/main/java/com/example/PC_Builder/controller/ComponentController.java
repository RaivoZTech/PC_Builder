package com.example.PC_Builder.controller;

import com.example.PC_Builder.entity.Components;
import com.example.PC_Builder.service.ComponentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/components")
public class ComponentController {

    private final ComponentService componentService;

    @Autowired
    public ComponentController(ComponentService componentService) {
        this.componentService = componentService;
    }

    // Fetch components by type
    @GetMapping("/type/{type}")
    public ResponseEntity<List<Components>> getComponentsByType(@PathVariable String type) {
        List<Components> components = componentService.getComponentsByType(type);
        return new ResponseEntity<>(components, HttpStatus.OK);
    }

    // Add a new component
    @PostMapping
    public ResponseEntity<Components> addComponent(@RequestBody Components component) {
        Components newComponent = componentService.addComponent(component);
        return new ResponseEntity<>(newComponent, HttpStatus.CREATED);
    }

    // Delete a component by ID
    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteComponent(@PathVariable Long id) {
        componentService.deleteComponent(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    // Fetch all components
    @GetMapping
    public ResponseEntity<List<Components>> getAllComponents() {
        List<Components> allComponents = componentService.getAllComponents();
        return new ResponseEntity<>(allComponents, HttpStatus.OK);
    }

}
