import 'package:dartz/dartz.dart';
import 'package:gimme_goals/core/error/failures.dart';

abstract class ProfileRepository {
  Future<Either<Failure, void>> logout();
}
