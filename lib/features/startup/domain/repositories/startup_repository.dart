import 'package:dartz/dartz.dart';
import 'package:gimme_goals/core/error/failures.dart';

abstract class StartupRepository {
  Future<Either<Failure, void>> initializeAmplifyConfiguration();
}
