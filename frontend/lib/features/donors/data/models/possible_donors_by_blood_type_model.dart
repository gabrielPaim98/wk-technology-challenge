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
      receptorType: json['receptor_type'] as String,
      donorCount: json['donor_count'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'receptor_type': receptorType,
      'donor_count': donorCount,
    };
  }

  PossibleDonors toEntity() {
    return PossibleDonors(
      receptorType: receptorType,
      donorCount: donorCount,
    );
  }
}
