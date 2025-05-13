package com.example.backend.domain;

import com.example.backend.dtos.AddDonorRequestDto;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;

@Entity
@Table(name = "donors")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Donor {

    @Id
    @Column(length = 14)
    private String cpf;

    private String nome;
    private String rg;

    @Column(name = "data_nasc")
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

    @Column(name = "telefone_fixo")
    private String telefoneFixo;

    private String celular;
    private Double altura;
    private Double peso;

    @Column(name = "tipo_sanguineo")
    private String tipoSanguineo;

    public Donor(AddDonorRequestDto data) {
        this.cpf = data.getCpf();
        this.nome = data.getNome();
        this.rg = data.getRg();
        this.dataNasc = data.getDataNasc();
        this.sexo = data.getSexo();
        this.mae = data.getMae();
        this.pai = data.getPai();
        this.email = data.getEmail();
        this.cep = data.getCep();
        this.endereco = data.getEndereco();
        this.numero = data.getNumero();
        this.bairro = data.getBairro();
        this.cidade = data.getCidade();
        this.estado = data.getEstado();
        this.telefoneFixo = data.getTelefoneFixo();
        this.celular = data.getCelular();
        this.altura = data.getAltura();
        this.peso = data.getPeso();
        this.tipoSanguineo = data.getTipoSanguineo();
    }
}