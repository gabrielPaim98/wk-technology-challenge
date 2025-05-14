import 'package:dartz/dartz.dart';
import '../entities/donors_age_by_type.dart';

import '../../../../core/failures/failure.dart';
import '../entities/donors_by_age.dart';
import '../entities/donors_by_state.dart';
import '../entities/donors_obesity_by_gender.dart';
import '../entities/possible_donors.dart';

abstract class DonorsRepository {
  Future<Either<Failure, void>> syncDonors();
  Future<Either<Failure, List<DonorsAgeByType>>> getDonorsAgeByType();
  Future<Either<Failure, List<DonorsByAge>>> getDonorsByAge();
  Future<Either<Failure, List<DonorsByState>>> getDonorsByState();
  Future<Either<Failure, List<DonorsObesityByGender>>> getObesityByGender();
  Future<Either<Failure, List<PossibleDonors>>> getPossibleDonors();
}
