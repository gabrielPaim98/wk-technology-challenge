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
      bloodType: json['bloodType'] as String,
      averageAge: json['averageAge'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bloodType': bloodType,
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
