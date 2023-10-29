import 'package:dartz/dartz.dart';
import 'package:gimme_goals/core/error/failures.dart';

abstract class RegisterRepository {
  Future<Either<Failure, void>> registerAccount(String email, String password);
}
