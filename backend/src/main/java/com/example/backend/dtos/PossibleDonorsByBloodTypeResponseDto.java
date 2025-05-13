package com.example.backend.dtos;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class PossibleDonorsByBloodTypeResponseDto {
    private String receptorType;
    private Long donorCount;
}
