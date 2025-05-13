import 'package:equatable/equatable.dart';

class PossibleDonors extends Equatable {
  final String receptorType;
  final int donorCount;

  const PossibleDonors({
    required this.receptorType,
    required this.donorCount,
  });

  @override
  List<Object?> get props => [receptorType, donorCount];
}
