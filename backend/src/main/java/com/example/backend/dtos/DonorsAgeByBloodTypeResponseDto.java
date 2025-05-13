package com.example.backend.dtos;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class DonorsAgeByBloodTypeResponseDto {
    private String bloodType;
    private Double averageAge;
}
