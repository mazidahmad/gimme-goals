import 'package:dartz/dartz.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/error/failures.dart';
import 'package:gimme_goals/features/verification/domain/repositories/verification_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class VerifyAccount {
  final VerificationRepository _repo = getIt<VerificationRepository>();

  Future<Either<Failure, void>> execute(String email, String code) =>
      _repo.verifyAccount(email, code);
}
