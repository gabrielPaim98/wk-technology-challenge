import 'package:equatable/equatable.dart';

class DonorsByAge extends Equatable {
  final String ageRange;
  final double averageBmi;

  const DonorsByAge({
    required this.ageRange,
    required this.averageBmi,
  });

  @override
  List<Object?> get props => [ageRange, averageBmi];
}
