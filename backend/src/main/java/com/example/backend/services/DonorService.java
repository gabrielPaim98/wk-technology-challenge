package com.example.backend.services;

import com.example.backend.dtos.*;
import com.example.backend.domain.Donor;
import com.example.backend.repositories.DonorRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class DonorService {

    private final DonorRepository donorRepository;

    private static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");

    public void saveAllDonors(List<AddDonorRequestDto> donorDTOList) {
        List<Donor> donors = donorDTOList.stream().map(Donor::new).collect(Collectors.toList());
        donorRepository.saveAll(donors);
    }

    public List<DonorsByStateResponseDto> getDonorsByState() {
          return  donorRepository.countByEstado().stream()
                  .map(p -> new DonorsByStateResponseDto(p.getEstado(), p.getTotal()))
                  .toList();
    }

    public List<DonorsByAgeResponseDto> getDonorsByAge() {
        Map<String, List<Double>> ageRangeMap = new HashMap<>();
        LocalDate now = LocalDate.now();

        for (Donor d : donorRepository.findAll()) {
            try {
                int age = now.getYear() - d.getDataNasc().getYear();
                String range = (age / 10) * 10 + "-" + (((age / 10) * 10) + 9);
                double bmi = d.getPeso() / (d.getAltura() * d.getAltura());

                ageRangeMap.putIfAbsent(range, new ArrayList<>());
                ageRangeMap.get(range).add(bmi);
            } catch (Exception ignored) {}
        }

        return ageRangeMap.entrySet().stream()
                .map(e -> {

                    return new DonorsByAgeResponseDto(
                            e.getKey(),
                            e.getValue().stream().mapToDouble(Double::doubleValue).average().orElse(0)
                    );
                })
                .collect(Collectors.toList());
    }

    public List<DonorsObesityByGenderResponseDto> getDonorsObesityByGender() {
        return donorRepository.obesityPercentageByGender().stream().map(d -> new DonorsObesityByGenderResponseDto(
                d.getSexo(),
                d.getPercentual()
        )).toList();
    }

    public List<DonorsAgeByBloodTypeResponseDto> getDonorsAgeByBloodType() {
        return donorRepository.averageAgeByBloodType().stream().map(d -> new DonorsAgeByBloodTypeResponseDto(
                d.getTipoSanguineo(),
                d.getIdade()
        )).toList();
    }

    public List<PossibleDonorsByBloodTypeResponseDto> getPossibleDonorsByBloodType() {
        Map<String, List<String>> compatibilityMap = Map.of(
                "A+", List.of("A+", "A-", "O+", "O-"),
                "A-", List.of("A-", "O-"),
                "B+", List.of("B+", "B-", "O+", "O-"),
                "B-", List.of("B-", "O-"),
                "AB+", List.of("A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"),
                "AB-", List.of("A-", "B-", "AB-", "O-"),
                "O+", List.of("O+", "O-"),
                "O-", List.of("O-")
        );

        List<Donor> validDonors = donorRepository.findValidDonors();

        List<PossibleDonorsByBloodTypeResponseDto> result = new ArrayList<>();

        for (String receptor : compatibilityMap.keySet()) {
            List<String> acceptedTypes = compatibilityMap.get(receptor);
            long count = validDonors.stream()
                    .filter(d -> acceptedTypes.contains(d.getTipoSanguineo()))
                    .count();

            result.add(new PossibleDonorsByBloodTypeResponseDto(receptor, count));
        }

        return result;
    }
}
