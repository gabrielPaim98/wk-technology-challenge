# Flutter Agência de Bando de Sangue 🩸

Este é um aplicativo Flutter desenvolvido para visualizar estatísticas detalhadas sobre doadores de sangue com base em dados fornecidos por um backend Spring Boot. O app exibe gráficos e listas com informações úteis para análises populacionais de saúde.

---

## 🚀 Funcionalidades

- 📊 Visualização da idade média por tipo sanguíneo
- 📍 Contagem de doadores por estado
- 🧮 Média de IMC por faixa etária
- ⚖️ Percentual de obesidade por sexo
- 🔁 Tipos de doadores possíveis para cada tipo sanguíneo receptor

---

## 📁 Estrutura do Projeto

```
lib/
├── main.dart                      # Ponto de Entrada do App
├── config/                        # Configurações Gerais
│   ├── routes/                    # Rotas
│   ├── theme/                     # Tema
├── core/                          # Configurações multi-funcionais
│   ├── constants/                 # Constantes
│   ├── failures/                  # Falhas Gerais
│   └── usecases/                  # Casos de Uso
├── features/
│   └── donors/                    # Funcionalidade de Doadores
│       ├── data/                  # Models, API client, repository
│       ├── domain/                # Entidades & Casos de Uso
│       └── presentation/          # Blocs, pages, widgets

```

---

## 🛠 Tech Stack

- **Flutter & Dart**
- **State Management** : BLoC (`flutter_bloc`)
- **Networking** : `http`
- **Routing** : `go_router`

---

## 🔧 Como Executar

### Pré-Requisitos

- Flutter SDK ≥ 3.0
- Dart ≥ 2.18

### Instalação

1. **Clone o repo**

   ```bash
   git clone https://github.com/gabrielPaim98/wk-technology-challenge.git
   cd frontend
   ```

2. **Instalar dependências**

   ```bash
   flutter pub get
   ```

### Executar

- **Mobile / Desktop**
  ```bash
  flutter run    # selects connected device or opens desktop
  ```
- **Web**
  ```bash
  flutter run -d chrome
  ```

---

## 🧱 Arquitetura do Projeto

1. **Presentation Layer**
   - UI pages e Widgets
   - BLoCs handle events → emit states
2. **Domain Layer**
   - Lógicas de negócios encapsuladas em Casos de Uso
3. **Data Layer**
   - Repositories com remote data sources
   - Models com JSON parsing
