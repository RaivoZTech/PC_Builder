package com.example.PC_Builder.service;
import com.example.PC_Builder.dto.BuildDto;
import com.example.PC_Builder.entity.Components;
import com.example.PC_Builder.entity.PCBuild;
import com.example.PC_Builder.entity.User;
import com.example.PC_Builder.respository.ComponentRepository;
import com.example.PC_Builder.respository.PCBuildRepository;
import com.example.PC_Builder.respository.UserRepository;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.json.JSONObject;
import lombok.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class    PCBuildService {

    private final ComponentRepository componentRepository;
    private final PCBuildRepository pcBuildRepository;
    private final UserRepository userRepository;

    @Autowired
    public PCBuildService(ComponentRepository componentRepository, PCBuildRepository pcBuildRepository, UserRepository userRepository) {
        this.componentRepository = componentRepository;
        this.pcBuildRepository = pcBuildRepository;
        this.userRepository = userRepository;
    }

    public String checkCompatibility(List<Long> componentIds) {
        List<Components> components = componentRepository.findByIdIn(componentIds);
        HashMap<String, JSONObject> componentSpecs = new HashMap<>();

        // Log the received component IDs and the fetched components
        System.out.println("Received Component IDs: " + componentIds);
        System.out.println("Fetched Components: " + components);

        for (Components component : components) {
            JSONObject specs = new JSONObject(component.getSpecs());
            componentSpecs.put(component.getType(), specs);
        }

        System.out.println("Preparing to check CPU - Motherboard Compatibility");
        if (componentSpecs.containsKey("CPU") && componentSpecs.containsKey("Motherboard")) {
            // Additional log to confirm the check is being executed
            System.out.println("Executing CPU - Motherboard Compatibility Check");


            // CPU - Motherboard Compatibility Check
            if (componentSpecs.containsKey("CPU") && componentSpecs.containsKey("Motherboard")) {
                JSONObject cpu = componentSpecs.get("CPU");
                JSONObject motherboard = componentSpecs.get("Motherboard");

                // Log the comparison details
                System.out.println("Checking compatibility: CPU Socket - " + cpu.getString("socket") + ", Motherboard Socket - " + motherboard.getString("socket"));

                if (!cpu.getString("socket").equals(motherboard.getString("socket"))) {
                    String message = " CPU socket " + cpu.getString("socket") +
                            " does not match Motherboard socket " + motherboard.getString("socket");
                    System.out.println(message);
                    return message;
                }
            }
        }

        System.out.println("Preparing to check Case - Motherboard Form Factor Compatibility");
        if (componentSpecs.containsKey("Case") && componentSpecs.containsKey("Motherboard")) {
            // Additional log to confirm the check is being executed
            System.out.println("Executing Case - Motherboard Form Factor Compatibility Check");

            // Case - Motherboard Form Factor Compatibility Check
            if (componentSpecs.containsKey("Case") && componentSpecs.containsKey("Motherboard")) {
                JSONObject caseSpecs = componentSpecs.get("Case");
                JSONObject motherboardSpecs = componentSpecs.get("Motherboard");

                String motherboardFormFactor = motherboardSpecs.getString("formFactor");
                JSONArray caseFormFactors = caseSpecs.getJSONArray("formFactor");

                System.out.println("Checking compatibility for Case and Motherboard Form Factors");
                System.out.println("Motherboard Form Factor: " + motherboardFormFactor);
                System.out.println("Case Form Factors: " + caseFormFactors);

                if (!caseFormFactors.toList().contains(motherboardFormFactor)) {
                    String message = " Motherboard form factor " + motherboardFormFactor +
                            " does not match Case form factors " + caseFormFactors.toString();
                    return message;
                }
            }
        }
        if (componentSpecs.containsKey("RAM") && componentSpecs.containsKey("Motherboard")) {
            JSONObject ram = componentSpecs.get("RAM");
            JSONObject motherboard = componentSpecs.get("Motherboard");


            if (!ram.getString("memoryType").equals(motherboard.getString("memoryType"))) {
                String message = "RAM type " + ram.getString("memoryType") +
                        " is not compatible with Motherboard memory type " + motherboard.getString("memoryType");
                System.out.println("Compatibility Check Result: " + message);
                return message;
            }

            if (ram.has("speed") && motherboard.has("maxMemorySpeed")) {
                String ramSpeedStr = ram.getString("speed").replaceAll("[^0-9]", "");
                String moboMaxSpeedStr = motherboard.getString("maxMemorySpeed").replaceAll("[^0-9]", "");

                int ramSpeed = Integer.parseInt(ramSpeedStr);
                int moboMaxSpeed = Integer.parseInt(moboMaxSpeedStr);

                System.out.println("RAM Speed: " + ramSpeed + "MHz");
                System.out.println("Motherboard Max Memory Speed: " + moboMaxSpeed + "MHz");

                if (ramSpeed > moboMaxSpeed) {
                    String message = " RAM speed " + ramSpeed + "MHz exceeds Motherboard maximum memory speed " + moboMaxSpeed + "MHz";
                    System.out.println("Incompatibility Found: " + message);
                    return message;
                }
            }
        }

        // GPU - Case Compatibility Check
        if (componentSpecs.containsKey("GPU") && componentSpecs.containsKey("Case")) {
            JSONObject gpu = componentSpecs.get("GPU");
            JSONObject caseSpec = componentSpecs.get("Case");

            // Extract and parse GPU length and max GPU length
            int gpuLength = parseDimension(gpu.getString("dimensions"));
            System.out.println(gpuLength);
            int maxGpuLength = parseDimension(caseSpec.getString("maxGPULength"));
            System.out.println(maxGpuLength);

            System.out.println("Checking compatibility: GPU Length - " + gpuLength + "mm, Case Max GPU Length - " + maxGpuLength + "mm");

            if (gpuLength > maxGpuLength) {
                String message = " GPU length " + gpuLength + "mm exceeds Case maximum GPU length " + maxGpuLength + "mm";
                System.out.println(message);
                return message;
            }
        }

        // PSU - Components Power Requirements Compatibility Check
        if (componentSpecs.containsKey("PSU")) {
            int totalPowerRequired = 0;
            int psuPower = componentSpecs.get("PSU").getInt("wattage");

            for (JSONObject spec : componentSpecs.values()) {
                if (spec.has("power")) {
                    totalPowerRequired += spec.getInt("power");
                }
            }
            System.out.println("Total power calculated: " + totalPowerRequired);

            if (psuPower < totalPowerRequired) {
                String message = "Total power required (" + totalPowerRequired + "W) exceeds PSU capacity (" + psuPower + "W)";
                System.out.println(message);
            }
        }


        // Storage Device - Motherboard Interface Compatibility Check
        if (componentSpecs.containsKey("SSD") && componentSpecs.containsKey("Motherboard")) {
            JSONObject ssd = componentSpecs.get("SSD");
            JSONObject motherboard = componentSpecs.get("Motherboard");

            String ssdInterface = ssd.getString("interface").split(" ")[0]; // Get the first word of SSD interface (e.g., "NVMe", "SATA")
            String[] moboInterfaces = motherboard.getString("interface").split(", "); // Split motherboard interfaces

            System.out.println("Checking compatibility: SSD Interface - " + ssdInterface + ", Motherboard Interfaces - " + Arrays.toString(moboInterfaces));

            boolean compatible = false;
            for (String moboInterface : moboInterfaces) {
                if (moboInterface.contains(ssdInterface)) {
                    compatible = true;
                    break;
                }
            }

            if (!compatible) {
                String message = " SSD interface " + ssdInterface +
                        " is not compatible with Motherboard interfaces " + Arrays.toString(moboInterfaces);
                System.out.println(message);
                return message;
            }
        }


        System.out.println("Components are Compatible");
            return "Compatible"; // Default return value if all checks pass

        }


    private int parseDimension(String dimension) {
        try {
            Pattern pattern = Pattern.compile("\\d+");
            Matcher matcher = pattern.matcher(dimension);
            if (matcher.find()) {
                return Integer.parseInt(matcher.group());
            }
        } catch (NumberFormatException e) {
            System.out.println("Error parsing dimension: " + dimension);
        }
        return -1;
    }


    public PCBuild savePCBuild(BuildDto buildRequest) {
        User user = userRepository.findById(buildRequest.getUserId())
                .orElseThrow(() -> new RuntimeException("User not found"));

        List<Components> components = componentRepository.findByIdIn(buildRequest.getComponentIds());

        PCBuild pcBuild = new PCBuild();
        pcBuild.setUser(user);
        pcBuild.setComponents(components);

        return pcBuildRepository.save(pcBuild);
    }

    // Method to get a build by ID
    public PCBuild getPCBuildById(Long buildId) {
        return pcBuildRepository.findById(buildId)
                .orElseThrow(() -> new RuntimeException("Build not found"));
    }


    // Method to delete a build
    public void deletePCBuild(Long buildId) {
        pcBuildRepository.deleteById(buildId);
    }

    // Method to update a build
    public PCBuild updatePCBuild(Long buildId, BuildDto buildDto) {
        PCBuild pcBuild = getPCBuildById(buildId);
        List<Components> components = componentRepository.findAllById(buildDto.getComponentIds());
        pcBuild.setComponents(components);
        if (buildDto.getImageUrl() != null && !buildDto.getImageUrl().isEmpty()) {
            pcBuild.setImageUrl(buildDto.getImageUrl());
        }
        return pcBuildRepository.save(pcBuild);
    }
    public List<PCBuild> getBuildsByUserId(Long userId) {
        return pcBuildRepository.findByUserId(userId);
    }


    public PCBuild updateBuildImage(Long buildId, String imageUrl) {
        PCBuild pcBuild = getPCBuildById(buildId);
        pcBuild.setImageUrl(imageUrl);
        return pcBuildRepository.save(pcBuild);
    }
}
