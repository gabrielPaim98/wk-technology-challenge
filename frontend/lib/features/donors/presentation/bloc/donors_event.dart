part of 'donors_bloc.dart';

sealed class DonorsEvent extends Equatable {
  const DonorsEvent();

  @override
  List<Object> get props => [];
}

final class SyncDonorsEvent extends DonorsEvent {
  const SyncDonorsEvent();
}

final class GetDonorsAgeByTypeEvent extends DonorsEvent {
  const GetDonorsAgeByTypeEvent();
}

final class GetDonorsByAgeEvent extends DonorsEvent {
  const GetDonorsByAgeEvent();
}

final class GetDonorsByStateEvent extends DonorsEvent {
  const GetDonorsByStateEvent();
}

final class GetDonorsObesityByGenderEvent extends DonorsEvent {
  const GetDonorsObesityByGenderEvent();
}

final class GetPossibleDonorsEvent extends DonorsEvent {
  const GetPossibleDonorsEvent();
}
