import '../../domain/entities/donors_by_state.dart';

class DonorsByStateModel {
  final String state;
  final int count;

  const DonorsByStateModel({
    required this.state,
    required this.count,
  });

  factory DonorsByStateModel.fromJson(Map<String, dynamic> json) {
    return DonorsByStateModel(
      state: json['state'] as String,
      count: json['count'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'state': state,
      'count': count,
    };
  }

  DonorsByState toEntity() {
    return DonorsByState(
      state: state,
      count: count,
    );
  }
}
