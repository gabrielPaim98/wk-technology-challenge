import 'package:equatable/equatable.dart';

class DonorsObesityByGender extends Equatable {
  final String gender;
  final double percentage;

  const DonorsObesityByGender({
    required this.gender,
    required this.percentage,
  });

  @override
  List<Object?> get props => [gender, percentage];
}
