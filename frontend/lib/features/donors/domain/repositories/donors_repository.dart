import 'package:dartz/dartz.dart';
import '../entities/donors_age_by_type.dart';

import '../../../../core/failures/failure.dart';
import '../entities/donors_by_age.dart';
import '../entities/donors_by_state.dart';
import '../entities/donors_obesity_by_gender.dart';
import '../entities/possible_donors.dart';

abstract class DonorsRepository {
  Future<Either<Failure, void>> syncDonors();
  Future<Either<Failure, DonorsAgeByType>> getDonorsAgeByType();
  Future<Either<Failure, DonorsByAge>> getDonorsByAge();
  Future<Either<Failure, DonorsByState>> getDonorsByState();
  Future<Either<Failure, DonorsObesityByGender>> getObesityByGender();
  Future<Either<Failure, PossibleDonors>> getPossibleDonors();
}
