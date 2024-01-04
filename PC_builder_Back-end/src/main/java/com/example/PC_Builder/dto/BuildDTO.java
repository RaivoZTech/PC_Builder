package com.example.PC_Builder.dto;

    import lombok.Data;
    import java.util.List;

    @Data
    public class BuildDto {
        private Long userId;
        private List<Long> componentIds;
        private String imageUrl;

    }
