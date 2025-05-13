package com.example.backend.dtos;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class DonorsByAgeResponseDto {
    private String ageRange;
    private Double averageBmi;
}
