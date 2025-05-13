import 'package:equatable/equatable.dart';

class DonorsAgeByType extends Equatable {
  final String bloodType;
  final double averageAge;

  const DonorsAgeByType({
    required this.bloodType,
    required this.averageAge,
  });

  @override
  List<Object?> get props => [bloodType, averageAge];
}
