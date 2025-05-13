import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../../../core/usecases/async_usecase.dart';
import '../repositories/donors_repository.dart';

class SyncDonorsUsecase implements AsyncUsecase<void, void> {
  final DonorsRepository repository;

  const SyncDonorsUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(void params) async {
    try {
      return await repository.syncDonors();
    } catch (e) {
      return Left(Failure(
        message: e.toString(),
      ));
    }
  }
}
