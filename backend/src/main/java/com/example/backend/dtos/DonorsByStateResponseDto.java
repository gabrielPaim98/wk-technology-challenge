package com.example.backend.dtos;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class DonorsByStateResponseDto {
    private String state;
    private Long count;
}
