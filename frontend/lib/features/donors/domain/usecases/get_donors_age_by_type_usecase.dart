import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../../../core/usecases/async_usecase.dart';
import '../entities/donors_age_by_type.dart';
import '../entities/statistics_type.dart';
import '../failures/get_statistics_failure.dart';
import '../parameters/get_statistics_parameters.dart';
import '../repositories/donors_repository.dart';

class GetDonorsAgeByTypeUsecase
    implements AsyncUsecase<List<DonorsAgeByType>, GetStatisticsParameters> {
  final DonorsRepository repository;

  const GetDonorsAgeByTypeUsecase(this.repository);

  @override
  Future<Either<Failure, List<DonorsAgeByType>>> call(
      GetStatisticsParameters params) async {
    try {
      if (params.type != StatisticsType.donorsAgeByBloodType) {
        return Left(
          const GetStatisticsFailure(
            message: 'Invalid type for GetDonorsAgeByTypeUsecase',
          ),
        );
      }

      return await repository.getDonorsAgeByType();
    } catch (e) {
      return Left(Failure(
        message: e.toString(),
      ));
    }
  }
}
