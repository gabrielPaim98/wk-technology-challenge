import '../../domain/entities/donors_obesity_by_gender.dart';

class DonorsObesityByGenderModel {
  final String gender;
  final double percentage;

  const DonorsObesityByGenderModel({
    required this.gender,
    required this.percentage,
  });

  factory DonorsObesityByGenderModel.fromJson(Map<String, dynamic> json) {
    return DonorsObesityByGenderModel(
      gender: json['gender'],
      percentage: json['percentage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gender': gender,
      'percentage': percentage,
    };
  }

  DonorsObesityByGender toEntity() {
    return DonorsObesityByGender(
      gender: gender,
      percentage: percentage,
    );
  }
}
