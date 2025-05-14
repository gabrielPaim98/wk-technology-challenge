import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/donors_age_by_type.dart';
import '../../domain/entities/donors_by_age.dart';
import '../../domain/entities/donors_by_state.dart';
import '../../domain/entities/donors_obesity_by_gender.dart';
import '../../domain/entities/possible_donors.dart';
import '../../domain/entities/statistics_type.dart';
import '../../domain/parameters/get_statistics_parameters.dart';
import '../../domain/usecases/get_donors_age_by_type_usecase.dart';
import '../../domain/usecases/get_donors_by_age_usecase.dart';
import '../../domain/usecases/get_donors_by_state_usecase.dart';
import '../../domain/usecases/get_obesity_by_gender_usecase.dart';
import '../../domain/usecases/get_possible_donors_usecase.dart';
import '../../domain/usecases/sync_donors_usecase.dart';

part 'donors_event.dart';
part 'donors_state.dart';

class DonorsBloc extends Bloc<DonorsEvent, DonorsState> {
  final GetDonorsAgeByTypeUsecase _getDonorsAgeByTypeUsecase;
  final GetDonorsByAgeUsecase _getDonorsByAgeUsecase;
  final GetDonorsByStateUsecase _getDonorsByStateUsecase;
  final GetObesityByGenderUsecase _getObesityByGenderUsecase;
  final GetPossibleDonorsUsecase _getPossibleDonorsUsecase;
  final SyncDonorsUsecase _syncDonorsUsecase;

  DonorsBloc(
    this._getDonorsAgeByTypeUsecase,
    this._getDonorsByAgeUsecase,
    this._getDonorsByStateUsecase,
    this._getObesityByGenderUsecase,
    this._getPossibleDonorsUsecase,
    this._syncDonorsUsecase,
  ) : super(DonorsInitial()) {
    on<SyncDonorsEvent>(_onSyncDonors);
    on<GetDonorsAgeByTypeEvent>(_onGetDonorsAgeByType);
    on<GetDonorsByAgeEvent>(_onGetDonorsByAge);
    on<GetDonorsByStateEvent>(_onGetDonorsByState);
    on<GetDonorsObesityByGenderEvent>(_onGetObesityByGender);
    on<GetPossibleDonorsEvent>(_onGetPossibleDonors);
  }

  FutureOr<void> _onSyncDonors(
      SyncDonorsEvent event, Emitter<DonorsState> emit) async {
    emit(DonorsSyncing());
    final result = await _syncDonorsUsecase(null);
    result.fold(
      (failure) {
        emit(
          DonorsLoadError(
            message: failure.message,
            statisticsType: StatisticsType.sync,
          ),
        );
      },
      (success) {
        emit(DonorsInitial());
      },
    );
  }

  FutureOr<void> _onGetDonorsAgeByType(
      GetDonorsAgeByTypeEvent event, Emitter<DonorsState> emit) async {
    emit(DonorsLoading());
    final result = await _getDonorsAgeByTypeUsecase(
      GetStatisticsParameters(
        type: StatisticsType.donorsAgeByBloodType,
      ),
    );

    result.fold(
      (failure) {
        emit(
          DonorsLoadError(
            message: failure.message,
            statisticsType: StatisticsType.donorsAgeByBloodType,
          ),
        );
      },
      (donors) {
        emit(DonorsAgeByTypeLoaded(donorsAgeByType: donors));
      },
    );
  }

  FutureOr<void> _onGetDonorsByAge(
      GetDonorsByAgeEvent event, Emitter<DonorsState> emit) async {
    emit(DonorsLoading());
    final result = await _getDonorsByAgeUsecase(
      GetStatisticsParameters(
        type: StatisticsType.donorsByAge,
      ),
    );
    result.fold(
      (failure) {
        emit(
          DonorsLoadError(
            message: failure.message,
            statisticsType: StatisticsType.donorsByAge,
          ),
        );
      },
      (donors) {
        emit(DonorsByAgeLoaded(donorsByAge: donors));
      },
    );
  }

  FutureOr<void> _onGetDonorsByState(
      GetDonorsByStateEvent event, Emitter<DonorsState> emit) async {
    emit(DonorsLoading());
    final result = await _getDonorsByStateUsecase(
      GetStatisticsParameters(
        type: StatisticsType.donorsByState,
      ),
    );
    result.fold(
      (failure) {
        emit(
          DonorsLoadError(
            message: failure.message,
            statisticsType: StatisticsType.donorsByState,
          ),
        );
      },
      (donors) {
        emit(DonorsByStateLoaded(donorsByState: donors));
      },
    );
  }

  FutureOr<void> _onGetObesityByGender(
      GetDonorsObesityByGenderEvent event, Emitter<DonorsState> emit) async {
    emit(DonorsLoading());
    final result = await _getObesityByGenderUsecase(
      GetStatisticsParameters(
        type: StatisticsType.donorsObesityByGender,
      ),
    );
    result.fold(
      (failure) {
        emit(
          DonorsLoadError(
            message: failure.message,
            statisticsType: StatisticsType.donorsObesityByGender,
          ),
        );
      },
      (donors) {
        emit(DonorsObesityByGenderLoaded(donorsObesityByGender: donors));
      },
    );
  }

  FutureOr<void> _onGetPossibleDonors(
      GetPossibleDonorsEvent event, Emitter<DonorsState> emit) async {
    emit(DonorsLoading());
    final result = await _getPossibleDonorsUsecase(
      GetStatisticsParameters(
        type: StatisticsType.possibleDonorsByBloodType,
      ),
    );
    result.fold(
      (failure) {
        emit(
          DonorsLoadError(
            message: failure.message,
            statisticsType: StatisticsType.possibleDonorsByBloodType,
          ),
        );
      },
      (donors) {
        emit(DonorsPossibleDonorsLoaded(possibleDonors: donors));
      },
    );
  }
}
