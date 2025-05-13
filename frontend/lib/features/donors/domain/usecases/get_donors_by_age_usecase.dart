import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../../../core/usecases/async_usecase.dart';
import '../entities/donors_by_age.dart';
import '../entities/statistics_type.dart';
import '../failures/get_statistics_failure.dart';
import '../parameters/get_statistics_parameters.dart';
import '../repositories/donors_repository.dart';

class GetDonorsByAgeUsecase
    implements AsyncUsecase<DonorsByAge, GetStatisticsParameters> {
  final DonorsRepository repository;

  const GetDonorsByAgeUsecase(this.repository);

  @override
  Future<Either<Failure, DonorsByAge>> call(
      GetStatisticsParameters params) async {
    try {
      if (params.type != StatisticsType.donorsByAge) {
        return Left(
          const GetStatisticsFailure(
            message: 'Invalid type for GetDonorsByAgeUsecase',
          ),
        );
      }

      return await repository.getDonorsByAge();
    } catch (e) {
      return Left(Failure(
        message: e.toString(),
      ));
    }
  }
}
