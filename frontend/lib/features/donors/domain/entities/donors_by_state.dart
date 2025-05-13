import 'package:equatable/equatable.dart';

class DonorsByState extends Equatable {
  final String state;
  final int count;

  const DonorsByState({
    required this.state,
    required this.count,
  });

  @override
  List<Object?> get props => [state, count];
}
