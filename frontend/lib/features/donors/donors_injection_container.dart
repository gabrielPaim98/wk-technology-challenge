import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'data/data_sources/remote/donors_remote_data_source.dart';
import 'data/data_sources/remote/donors_remote_data_source_impl.dart';
import 'data/repositories/donors_repository_impl.dart';
import 'domain/repositories/donors_repository.dart';
import 'domain/usecases/get_donors_age_by_type_usecase.dart';
import 'domain/usecases/get_donors_by_age_usecase.dart';
import 'domain/usecases/get_donors_by_state_usecase.dart';
import 'domain/usecases/get_obesity_by_gender_usecase.dart';
import 'domain/usecases/get_possible_donors_usecase.dart';
import 'domain/usecases/sync_donors_usecase.dart';
import 'presentation/bloc/donors_bloc.dart';

Future<void> initializeDonorsInjectionContainer(GetIt sl) async {
  // Dependencies
  sl.registerLazySingleton<http.Client>(() => http.Client());
  sl.registerLazySingleton<DonorsRemoteDataSource>(
    () => DonorsRemoteDataSourceImpl(
      client: sl(),
    ),
  );
  sl.registerLazySingleton<DonorsRepository>(
    () => DonorsRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton<GetDonorsAgeByTypeUsecase>(
    () => GetDonorsAgeByTypeUsecase(
      sl(),
    ),
  );
  sl.registerLazySingleton<GetDonorsByAgeUsecase>(
    () => GetDonorsByAgeUsecase(
      sl(),
    ),
  );
  sl.registerLazySingleton<GetDonorsByStateUsecase>(
    () => GetDonorsByStateUsecase(
      sl(),
    ),
  );
  sl.registerLazySingleton<GetObesityByGenderUsecase>(
    () => GetObesityByGenderUsecase(
      sl(),
    ),
  );
  sl.registerLazySingleton<GetPossibleDonorsUsecase>(
    () => GetPossibleDonorsUsecase(
      sl(),
    ),
  );
  sl.registerLazySingleton<SyncDonorsUsecase>(
    () => SyncDonorsUsecase(
      sl(),
    ),
  );

  // Bloc
  sl.registerFactory<DonorsBloc>(
    () => DonorsBloc(sl(), sl(), sl(), sl(), sl(), sl()),
  );
}
