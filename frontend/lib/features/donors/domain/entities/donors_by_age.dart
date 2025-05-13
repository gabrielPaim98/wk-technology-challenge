import 'package:equatable/equatable.dart';

class DonorsByAge extends Equatable {
  final String ageGroup;
  final int averageBmi;

  const DonorsByAge({
    required this.ageGroup,
    required this.averageBmi,
  });

  @override
  List<Object?> get props => [ageGroup, averageBmi];
}
