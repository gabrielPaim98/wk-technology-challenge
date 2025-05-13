package com.example.backend.repositories;

import com.example.backend.domain.Donor;
import com.example.backend.projections.AverageAgeByBloodTypeProjection;
import com.example.backend.projections.CountByEstadoProjection;
import com.example.backend.projections.ObesityPercentageByGenderProjection;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DonorRepository extends JpaRepository<Donor, String> {
    @Query("SELECT d.estado as estado, COUNT(d.cpf) as total FROM Donor d GROUP BY d.estado")
    List<CountByEstadoProjection> countByEstado();

    @Query("""
    SELECT d.sexo AS sexo,
           SUM(CASE WHEN (d.peso / (d.altura * d.altura)) > 30 THEN 1 ELSE 0 END) * 1.0 / COUNT(d) AS percentual
    FROM Donor d
    GROUP BY d.sexo
""")
    List<ObesityPercentageByGenderProjection> obesityPercentageByGender();

    @Query(value = """
    SELECT d.tipo_sanguineo AS tipoSanguineo,
           AVG(TIMESTAMPDIFF(YEAR, d.data_nasc, CURDATE())) AS idade
    FROM donors d
    GROUP BY d.tipo_sanguineo
""", nativeQuery = true)
    List<AverageAgeByBloodTypeProjection> averageAgeByBloodType();

    @Query(value = "SELECT d.* FROM donors d WHERE TIMESTAMPDIFF(YEAR, d.data_nasc, CURDATE()) BETWEEN 16 AND 69 AND d.peso > 50", nativeQuery = true)
    List<Donor> findValidDonors();
}