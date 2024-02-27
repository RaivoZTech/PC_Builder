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

    // Injecting ComponentService using constructor-based dependency injection
    private final ComponentService componentService;

    @Autowired
    public ComponentController(ComponentService componentService) {
        this.componentService = componentService;
    }

    // Endpoint to fetch components by their type
    @GetMapping("/type/{type}")
    public ResponseEntity<List<Components>> getComponentsByType(@PathVariable String type) {
        // Using the componentService to fetch components of a specified type
        List<Components> components = componentService.getComponentsByType(type);
        // Returning the list of components
        return new ResponseEntity<>(components, HttpStatus.OK);
    }

    // Endpoint to add a new component
    @PostMapping
    public ResponseEntity<Components> addComponent(@RequestBody Components component) {
        // Adding the component using componentService and receiving the newly added component
        Components newComponent = componentService.addComponent(component);
        // Returning the newly added component
        return new ResponseEntity<>(newComponent, HttpStatus.CREATED);
    }

    // Endpoint to delete a component by ID
    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteComponent(@PathVariable Long id) {
        // Deleting the component with the given ID using componentService
        componentService.deleteComponent(id);
        // Returning an HTTP status OK to indicate successful deletion
        return new ResponseEntity<>(HttpStatus.OK);
    }

    // Endpoint to fetch all components
    @GetMapping
    public ResponseEntity<List<Components>> getAllComponents() {
        // Getting all components using componentService
        List<Components> allComponents = componentService.getAllComponents();
        return new ResponseEntity<>(allComponents, HttpStatus.OK);
    }

}
