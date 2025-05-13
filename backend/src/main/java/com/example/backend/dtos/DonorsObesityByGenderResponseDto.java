package com.example.backend.dtos;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class DonorsObesityByGenderResponseDto {
    private String gender;
    private Double percentage;
}
