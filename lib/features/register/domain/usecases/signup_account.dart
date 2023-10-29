import 'package:dartz/dartz.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/error/failures.dart';
import 'package:gimme_goals/features/register/domain/repositories/register_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class SignUpAccount {
  final RegisterRepository _repo = getIt<RegisterRepository>();

  Future<Either<Failure, void>> execute(String email, String password) =>
      _repo.registerAccount(email, password);
}
