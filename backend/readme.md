# 🩸 Agência de Bando de Sangue - Spring Boot Backend

Este projeto é uma API RESTful desenvolvida com Spring Boot que fornece estatísticas e gerenciamento de doadores de sangue com base em informações demográficas e de saúde. Ele serve como backend para um dashboard Flutter que consome esses dados.

## 📌 Funcionalidades

- 📥 Registro de novos doadores
- 📊 Estatísticas por:
  - Idade média por tipo sanguíneo
  - IMC médio por faixa etária
  - Contagem de doadores por estado
  - Percentual de obesos por gênero
  - Possíveis doadores para cada tipo sanguíneo receptor
- 🔎 Filtros automáticos para doadores válidos (idade entre 16 e 69 anos e peso > 50kg)

## 🛠️ Tecnologias Utilizadas

- Java 17+
- Spring Boot 3.x
- Spring Data JPA
- MySQL / PostgreSQL
- Lombok
- Jakarta Persistence API (JPA)
- Maven

## 🗂️ Estrutura de Pacotes

```
backend/
├── controllers/ # Camada REST - expõe os endpoints
├── domain/ # Entidades JPA que representam o modelo de dados
├── dtos/ # Data Transfer Objects para requests e responses
├── projections/ # Interfaces para projections personalizadas no JPA
├── repositories/ # Interfaces JPA com queries específicas
├── services/ # Camada de regra de negócio
└── BackendApplication.java
```

## ▶️ Como Executar Localmente

### Pré-requisitos

- Java 17+
- Maven
- MySQL
- IDE ou terminal

### Passos

1. Clone o repositório:

```bash
git clone https://github.com/gabrielPaim98/wk-technology-challenge.git
cd backend
```

2. Configure seu `application.properties` ou `application.yml` com as credenciais do banco:
3. Execute o projeto:
4. Acesse a API em: `http://localhost:8080`

## 📬 Endpoints Principais

```pgsql
PUT    /donors                                      - Cadastrar novo(s) doador(es)
GET    /statistics/age-by-blood-type                - Idade média por tipo sanguíneo
GET    /statistics/age                              - IMC médio por faixa etária
GET    /statistics/state                            - Contagem de doadores por estado
GET    /statistics/obesity-by-gender                - Percentual de obesidade por sexo
GET    /statistics/possible-donors-by-blood-type    - Possíveis doadores por tipo sanguíneo

```

## 🧠 Arquitetura

O projeto segue o padrão **MVC (Model-View-Controller)** com separação clara de responsabilidades:

- **Controller** : Exposição de rotas HTTP
- **Service** : Regras de negócio e orquestração
- **Repository** : Acesso ao banco de dados com Spring Data JPA
- **DTOs** : Intermediários para entrada e saída de dados
- **Projections** : Otimização de queries com retorno customizado
