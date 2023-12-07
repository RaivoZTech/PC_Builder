package com.example.PC_Builder.service;

import com.example.PC_Builder.entity.Components;
import com.example.PC_Builder.respository.ComponentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ComponentService {
    private final ComponentRepository componentRepository;

    @Autowired
    public ComponentService(ComponentRepository repository){

        this.componentRepository = repository;
    }

    public List<Components> getComponentsByType(String type) {

        return componentRepository.findByType(type);
    }

    public Components addComponent(Components component) {
        return componentRepository.save(component);
    }
    public void deleteComponent(Long id) {
        componentRepository.deleteById(id);
    }


    public List<Components> getAllComponents() {
        return componentRepository.findAll();
    }
}
