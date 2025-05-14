part of 'donors_bloc.dart';

sealed class DonorsState extends Equatable {
  const DonorsState();

  @override
  List<Object> get props => [];
}

final class DonorsInitial extends DonorsState {}

final class DonorsLoading extends DonorsState {}

final class DonorsSyncing extends DonorsState {}

final class DonorsLoadError extends DonorsState {
  final String? message;
  final StatisticsType statisticsType;

  const DonorsLoadError({
    this.message,
    required this.statisticsType,
  });

  @override
  List<Object> get props => [
        if (message != null) message!,
        statisticsType,
      ];
}

final class DonorsAgeByTypeLoaded extends DonorsState {
  final List<DonorsAgeByType> donorsAgeByType;

  const DonorsAgeByTypeLoaded({
    required this.donorsAgeByType,
  });

  @override
  List<Object> get props => [donorsAgeByType];
}

final class DonorsByAgeLoaded extends DonorsState {
  final List<DonorsByAge> donorsByAge;

  const DonorsByAgeLoaded({
    required this.donorsByAge,
  });

  @override
  List<Object> get props => [donorsByAge];
}

final class DonorsByStateLoaded extends DonorsState {
  final List<DonorsByState> donorsByState;

  const DonorsByStateLoaded({
    required this.donorsByState,
  });

  @override
  List<Object> get props => [donorsByState];
}

final class DonorsObesityByGenderLoaded extends DonorsState {
  final List<DonorsObesityByGender> donorsObesityByGender;

  const DonorsObesityByGenderLoaded({
    required this.donorsObesityByGender,
  });

  @override
  List<Object> get props => [donorsObesityByGender];
}

final class DonorsPossibleDonorsLoaded extends DonorsState {
  final List<PossibleDonors> possibleDonors;

  const DonorsPossibleDonorsLoaded({
    required this.possibleDonors,
  });

  @override
  List<Object> get props => [possibleDonors];
}
