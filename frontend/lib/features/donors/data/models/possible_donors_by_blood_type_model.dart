import '../../domain/entities/possible_donors.dart';

class PossibleDonorsByBloodTypeModel {
  final String receptorType;
  final int donorCount;

  const PossibleDonorsByBloodTypeModel({
    required this.receptorType,
    required this.donorCount,
  });

  factory PossibleDonorsByBloodTypeModel.fromJson(Map<String, dynamic> json) {
    return PossibleDonorsByBloodTypeModel(
      receptorType: json['receptorType'] as String,
      donorCount: json['donorCount'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'receptorType': receptorType,
      'donorCount': donorCount,
    };
  }

  PossibleDonors toEntity() {
    return PossibleDonors(
      receptorType: receptorType,
      donorCount: donorCount,
    );
  }
}
