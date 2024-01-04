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

    private final PCBuildService pcBuildService;

    @Autowired
    public PCBuildController(PCBuildService pcBuildService) {
        this.pcBuildService = pcBuildService;
    }

    @PostMapping
    public ResponseEntity<PCBuild> createPCBuild(@RequestBody BuildDto buildRequest) {
        PCBuild pcBuild = pcBuildService.savePCBuild(buildRequest);
        return new ResponseEntity<>(pcBuild, HttpStatus.CREATED);
    }

    @PostMapping("/check-compatibility")
    public ResponseEntity<?> checkCompatibility(@RequestBody BuildDto buildRequest) {
        try {
            String compatibilityMessage = pcBuildService.checkCompatibility(buildRequest.getComponentIds());
            return new ResponseEntity<>(compatibilityMessage, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("Backend works incorrectly", HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/{buildId}")
    public ResponseEntity<PCBuild> getPCBuildById(@PathVariable Long buildId) {
        PCBuild pcBuild = pcBuildService.getPCBuildById(buildId);
        return ResponseEntity.ok(pcBuild);
    }

    @PutMapping("/{buildId}")
    public ResponseEntity<PCBuild> updatePCBuild(
            @PathVariable Long buildId,
            @RequestBody BuildDto buildDto) {
        PCBuild updatedPCBuild = pcBuildService.updatePCBuild(buildId, buildDto);
        return ResponseEntity.ok(updatedPCBuild);
    }

    @PutMapping("/{buildId}/image")
    public ResponseEntity<PCBuild> updateBuildImage(@PathVariable Long buildId, @RequestBody ImageUrlDto imageUrlDto) {
        PCBuild pcBuild = pcBuildService.updateBuildImage(buildId, imageUrlDto.getImageUrl());
        return ResponseEntity.ok(pcBuild);
    }

    // Endpoint to delete a build
    @DeleteMapping("/{buildId}")
    public ResponseEntity<?> deletePCBuild(@PathVariable Long buildId) {
        pcBuildService.deletePCBuild(buildId);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/user/{userId}")
    public ResponseEntity<List<PCBuild>> getBuildsByUser(@PathVariable Long userId) {
        List<PCBuild> builds = pcBuildService.getBuildsByUserId(userId);
        return ResponseEntity.ok(builds);
    }


}
