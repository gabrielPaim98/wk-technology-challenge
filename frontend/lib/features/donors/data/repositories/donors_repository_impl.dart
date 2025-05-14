import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../domain/entities/donors_age_by_type.dart';
import '../../domain/entities/donors_by_age.dart';
import '../../domain/entities/donors_by_state.dart';
import '../../domain/entities/donors_obesity_by_gender.dart';
import '../../domain/entities/possible_donors.dart';
import '../../domain/repositories/donors_repository.dart';
import '../data_sources/remote/donors_remote_data_source.dart';
import '../exceptions/server_exception.dart';

class DonorsRepositoryImpl implements DonorsRepository {
  final DonorsRemoteDataSource remoteDataSource;

  const DonorsRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, void>> syncDonors() async {
    try {
      await remoteDataSource.syncDonors();
      return const Right(null);
    } on ServerException {
      return Left(
        const Failure(
          message: 'Server error occurred',
        ),
      );
    } catch (e) {
      return Left(Failure(
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<Failure, List<DonorsAgeByType>>> getDonorsAgeByType() async {
    try {
      final donors = await remoteDataSource.getDonorsAgeByType();

      return Right(donors.map((d) => d.toEntity()).toList());
    } on ServerException {
      return Left(
        const Failure(
          message: 'Server error occurred',
        ),
      );
    } catch (e) {
      return Left(Failure(
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<Failure, List<DonorsByAge>>> getDonorsByAge() async {
    try {
      final donors = await remoteDataSource.getDonorsByAge();

      return Right(donors.map((d) => d.toEntity()).toList());
    } on ServerException {
      return Left(
        const Failure(
          message: 'Server error occurred',
        ),
      );
    } catch (e) {
      return Left(Failure(
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<Failure, List<DonorsByState>>> getDonorsByState() async {
    try {
      final donors = await remoteDataSource.getDonorsByState();

      return Right(donors.map((d) => d.toEntity()).toList());
    } on ServerException {
      return Left(
        const Failure(
          message: 'Server error occurred',
        ),
      );
    } catch (e) {
      return Left(Failure(
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<Failure, List<DonorsObesityByGender>>>
      getObesityByGender() async {
    try {
      final donors = await remoteDataSource.getObesityByGender();

      return Right(donors.map((d) => d.toEntity()).toList());
    } on ServerException {
      return Left(
        const Failure(
          message: 'Server error occurred',
        ),
      );
    } catch (e) {
      return Left(Failure(
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<Failure, List<PossibleDonors>>> getPossibleDonors() async {
    try {
      final donors = await remoteDataSource.getPossibleDonors();

      return Right(donors.map((d) => d.toEntity()).toList());
    } on ServerException {
      return Left(
        const Failure(
          message: 'Server error occurred',
        ),
      );
    } catch (e) {
      return Left(Failure(
        message: e.toString(),
      ));
    }
  }
}
