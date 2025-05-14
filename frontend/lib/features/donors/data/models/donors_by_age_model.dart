import '../../domain/entities/donors_by_age.dart';

class DonorsByAgeModel {
  final String ageRange;
  final double averageBmi;

  const DonorsByAgeModel({
    required this.ageRange,
    required this.averageBmi,
  });

  factory DonorsByAgeModel.fromJson(Map<String, dynamic> json) {
    return DonorsByAgeModel(
      ageRange: json['ageRange'],
      averageBmi: json['averageBmi'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ageRange': ageRange,
      'averageBmi': averageBmi,
    };
  }

  DonorsByAge toEntity() {
    return DonorsByAge(
      ageRange: ageRange,
      averageBmi: averageBmi,
    );
  }
}
