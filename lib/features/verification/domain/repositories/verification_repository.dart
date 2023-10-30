import 'package:dartz/dartz.dart';
import 'package:gimme_goals/core/error/failures.dart';

abstract class VerificationRepository {
  Future<Either<Failure, void>> verifyAccount(String email, String code);
}
