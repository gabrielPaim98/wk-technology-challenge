import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../../../core/usecases/async_usecase.dart';
import '../entities/donors_by_state.dart';
import '../entities/statistics_type.dart';
import '../failures/get_statistics_failure.dart';
import '../parameters/get_statistics_parameters.dart';
import '../repositories/donors_repository.dart';

class GetDonorsByStateUsecase
    implements AsyncUsecase<List<DonorsByState>, GetStatisticsParameters> {
  final DonorsRepository repository;

  const GetDonorsByStateUsecase(this.repository);

  @override
  Future<Either<Failure, List<DonorsByState>>> call(
      GetStatisticsParameters params) async {
    try {
      if (params.type != StatisticsType.donorsByState) {
        return Left(
          const GetStatisticsFailure(
            message: 'Invalid type for GetDonorsByStateUsecase',
          ),
        );
      }

      return await repository.getDonorsByState();
    } catch (e) {
      return Left(Failure(
        message: e.toString(),
      ));
    }
  }
}
