import '../../domain/entities/donors_age_by_type.dart';

class DonorsAgeByBloodTypeModel {
  final String bloodType;
  final double averageAge;

  const DonorsAgeByBloodTypeModel({
    required this.bloodType,
    required this.averageAge,
  });

  factory DonorsAgeByBloodTypeModel.fromJson(Map<String, dynamic> json) {
    return DonorsAgeByBloodTypeModel(
      bloodType: json['blood_type'] as String,
      averageAge: json['averageAge'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'blood_type': bloodType,
      'averageAge': averageAge,
    };
  }

  DonorsAgeByType toEntity() {
    return DonorsAgeByType(
      bloodType: bloodType,
      averageAge: averageAge,
    );
  }
}
