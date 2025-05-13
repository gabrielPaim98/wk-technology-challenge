import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../../../core/usecases/async_usecase.dart';
import '../entities/possible_donors.dart';
import '../entities/statistics_type.dart';
import '../failures/get_statistics_failure.dart';
import '../parameters/get_statistics_parameters.dart';
import '../repositories/donors_repository.dart';

class GetPossibleDonorsUsecase
    implements AsyncUsecase<PossibleDonors, GetStatisticsParameters> {
  final DonorsRepository repository;

  const GetPossibleDonorsUsecase(this.repository);

  @override
  Future<Either<Failure, PossibleDonors>> call(
      GetStatisticsParameters params) async {
    try {
      if (params.type != StatisticsType.possibleDonorsByBloodType) {
        return Left(
          const GetStatisticsFailure(
            message: 'Invalid type for GetPossibleDonorsUsecase',
          ),
        );
      }

      return await repository.getPossibleDonors();
    } catch (e) {
      return Left(Failure(
        message: e.toString(),
      ));
    }
  }
}
