package com.example.backend.dtos;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.time.LocalDate;

@Getter
@AllArgsConstructor
public class AddDonorRequestDto {
     private String nome;
     private String cpf;
     private String rg;
     @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy")
     @JsonProperty("data_nasc")
     private LocalDate dataNasc;
     private String sexo;
     private String mae;
     private String pai;
     private String email;
     private String cep;
     private String endereco;
     private Integer numero;
     private String bairro;
     private String cidade;
     private String estado;
     @JsonProperty("telefone_fixo")
     private String telefoneFixo;
     private String celular;
     private Double altura;
     private Double peso;
     @JsonProperty("tipo_sanguineo")
     private String tipoSanguineo;
}
