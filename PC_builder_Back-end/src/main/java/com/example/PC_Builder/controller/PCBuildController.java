package com.example.PC_Builder.controller;

import com.example.PC_Builder.dto.BuildDto;
import com.example.PC_Builder.dto.ImageUrlDto;
import com.example.PC_Builder.entity.PCBuild;
import com.example.PC_Builder.service.PCBuildService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/api/pcbuilds")
public class PCBuildController {

    // Service class handling PCBuild related operations
    private final PCBuildService pcBuildService;

    // Autowired constructor to inject PCBuildService
    @Autowired
    public PCBuildController(PCBuildService pcBuildService) {
        this.pcBuildService = pcBuildService;
    }

    // Endpoint to create a new PC Build
    @PostMapping
    public ResponseEntity<PCBuild> createPCBuild(@RequestBody BuildDto buildRequest) {
        // Save the PC build using buildRequest data
        PCBuild pcBuild = pcBuildService.savePCBuild(buildRequest);
        // Return the saved PCBuild object with HTTP status CREATED
        return new ResponseEntity<>(pcBuild, HttpStatus.CREATED);
    }

    // Endpoint to check compatibility of PC components
    @PostMapping("/check-compatibility")
    public ResponseEntity<?> checkCompatibility(@RequestBody BuildDto buildRequest) {
        try {
            // Check compatibility of components and return the result message
            String compatibilityMessage = pcBuildService.checkCompatibility(buildRequest.getComponentIds());
            return new ResponseEntity<>(compatibilityMessage, HttpStatus.OK);
        } catch (Exception e) {
            // Handle exceptions and return an error message
            return new ResponseEntity<>("Backend works incorrectly", HttpStatus.BAD_REQUEST);
        }
    }

    // Endpoint to retrieve a specific PC build by ID
    @GetMapping("/{buildId}")
    public ResponseEntity<PCBuild> getPCBuildById(@PathVariable Long buildId) {
        // Fetch the PC build by ID
        PCBuild pcBuild = pcBuildService.getPCBuildById(buildId);
        // Return the fetched PC build
        return ResponseEntity.ok(pcBuild);
    }

    // Endpoint to update a specific PC build
    @PutMapping("/{buildId}")
    public ResponseEntity<PCBuild> updatePCBuild(
            @PathVariable Long buildId,
            @RequestBody BuildDto buildDto) {
        // Update the PC build with new data
        PCBuild updatedPCBuild = pcBuildService.updatePCBuild(buildId, buildDto);
        // Return the updated PC build
        return ResponseEntity.ok(updatedPCBuild);
    }

    // Endpoint to update the image URL of a build
    @PutMapping("/{buildId}/image")
    public ResponseEntity<PCBuild> updateBuildImage(@PathVariable Long buildId, @RequestBody ImageUrlDto imageUrlDto) {
        // Update the image URL of the specified build
        PCBuild pcBuild = pcBuildService.updateBuildImage(buildId, imageUrlDto.getImageUrl());
        // Return the updated PC build
        return ResponseEntity.ok(pcBuild);
    }

    // Endpoint to delete a specific PC build
    @DeleteMapping("/{buildId}")
    public ResponseEntity<?> deletePCBuild(@PathVariable Long buildId) {
        // Delete the PC build by ID
        pcBuildService.deletePCBuild(buildId);
        // Return HTTP status OK to indicate successful deletion
        return ResponseEntity.ok().build();
    }

    // Endpoint to retrieve all builds for a specific user
    @GetMapping("/user/{userId}")
    public ResponseEntity<List<PCBuild>> getBuildsByUser(@PathVariable Long userId) {
        // Fetch builds associated with a user
        List<PCBuild> builds = pcBuildService.getBuildsByUserId(userId);
        return ResponseEntity.ok(builds);
    }


}
