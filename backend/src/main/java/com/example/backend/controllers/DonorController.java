package com.example.backend.controllers;

import com.example.backend.dtos.*;
import com.example.backend.services.DonorService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/donors")
@RequiredArgsConstructor
public class DonorController {
    @Autowired
    private DonorService donorService;

    @PutMapping()
    public ResponseEntity<String> addDonors(@RequestBody List<AddDonorRequestDto> body) {
        donorService.saveAllDonors(body);
        return ResponseEntity.ok("Donors saved successfully.");
    }

    @GetMapping("/statistics/state")
    public ResponseEntity<List<DonorsByStateResponseDto>> getDonorsByState() {
        List<DonorsByStateResponseDto> donors = donorService.getDonorsByState();

        return ResponseEntity.ok(donors);
    }

    @GetMapping("/statistics/age")
    public ResponseEntity<List<DonorsByAgeResponseDto>> getDonorsByAge() {
        List<DonorsByAgeResponseDto> donors = donorService.getDonorsByAge();

        return ResponseEntity.ok(donors);
    }

    @GetMapping("/statistics/obesity-by-gender")
    public ResponseEntity<List<DonorsObesityByGenderResponseDto>> getDonorsObesityByGender() {
        List<DonorsObesityByGenderResponseDto> donors = donorService.getDonorsObesityByGender();

        return ResponseEntity.ok(donors);
    }

    @GetMapping("/statistics/age-by-blood-type")
    public ResponseEntity<List<DonorsAgeByBloodTypeResponseDto>> getDonorsAgeByBloodType() {
        List<DonorsAgeByBloodTypeResponseDto> donors = donorService.getDonorsAgeByBloodType();

        return ResponseEntity.ok(donors);
    }

    @GetMapping("/statistics/possible-donors-by-blood-type")
    public ResponseEntity<List<PossibleDonorsByBloodTypeResponseDto>> getPossibleDonorsByBloodType() {
        List<PossibleDonorsByBloodTypeResponseDto> donors = donorService.getPossibleDonorsByBloodType();

        return ResponseEntity.ok(donors);
    }
}
