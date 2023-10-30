import 'package:dartz/dartz.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/error/failures.dart';
import 'package:gimme_goals/features/login/domain/repositories/login_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LoginAccount {
  final LoginRepository _repo = getIt<LoginRepository>();

  Future<Either<Failure, void>> execute(String email, String password) =>
      _repo.loginAccount(email, password);
}
