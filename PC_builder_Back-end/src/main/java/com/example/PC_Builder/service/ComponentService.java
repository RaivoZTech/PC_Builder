package com.example.PC_Builder.service;
import com.example.PC_Builder.entity.Components;
import com.example.PC_Builder.respository.ComponentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class ComponentService {
    // Injecting ComponentRepository dependency
    private final ComponentRepository componentRepository;

    // Autowiring the ComponentRepository in the constructor
    @Autowired
    public ComponentService(ComponentRepository repository) {
        this.componentRepository = repository;
    }

    // Method to fetch components by their type
    public List<Components> getComponentsByType(String type) {
        return componentRepository.findByType(type);
    }

    // Method to fetch components by their IDs
    public List<Components> getComponentsById(List<Long> componentIds) {
        return componentRepository.findByIdIn(componentIds);
    }

    // Method to add a new component to the database
    public Components addComponent(Components component) {
        return componentRepository.save(component);
    }

    // Method to delete a component by its ID
    public void deleteComponent(Long id) {
        componentRepository.deleteById(id);
    }

    // Method to fetch all components from the database
    public List<Components> getAllComponents() {
        return componentRepository.findAll();
    }
}
