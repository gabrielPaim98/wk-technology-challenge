import '../../../../core/failures/failure.dart';

class GetStatisticsFailure extends Failure {
  const GetStatisticsFailure({
    super.stackTrace,
    super.message,
    super.requestBody,
  });
}
