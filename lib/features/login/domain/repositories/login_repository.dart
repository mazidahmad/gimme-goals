import 'package:dartz/dartz.dart';
import 'package:gimme_goals/core/error/failures.dart';

abstract class LoginRepository {
  Future<Either<Failure, void>> loginAccount(String email, String password);
}
