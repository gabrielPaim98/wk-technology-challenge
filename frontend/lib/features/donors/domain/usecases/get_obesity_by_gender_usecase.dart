import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../../../core/usecases/async_usecase.dart';
import '../entities/donors_obesity_by_gender.dart';
import '../entities/statistics_type.dart';
import '../failures/get_statistics_failure.dart';
import '../parameters/get_statistics_parameters.dart';
import '../repositories/donors_repository.dart';

class GetObesityByGenderUsecase
    implements AsyncUsecase<DonorsObesityByGender, GetStatisticsParameters> {
  final DonorsRepository repository;

  const GetObesityByGenderUsecase(this.repository);

  @override
  Future<Either<Failure, DonorsObesityByGender>> call(
      GetStatisticsParameters params) async {
    try {
      if (params.type != StatisticsType.donorsObesityByGender) {
        return Left(
          const GetStatisticsFailure(
            message: 'Invalid type for GetObesityByGenderUsecase',
          ),
        );
      }

      return await repository.getObesityByGender();
    } catch (e) {
      return Left(Failure(
        message: e.toString(),
      ));
    }
  }
}
