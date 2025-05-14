import 'package:equatable/equatable.dart';
import '../entities/statistics_type.dart';

class GetStatisticsParameters extends Equatable {
  final StatisticsType type;

  const GetStatisticsParameters({
    required this.type,
  });

  @override
  List<Object?> get props => [type];
}
