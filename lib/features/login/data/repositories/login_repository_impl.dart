import 'package:dartz/dartz.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/error/failures.dart';
import 'package:gimme_goals/core/mixin/repository_mixin.dart';
import 'package:gimme_goals/features/login/data/datasources/login_remote_datasource.dart';
import 'package:gimme_goals/features/login/domain/repositories/login_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl extends LoginRepository with RepositoryMixin {
  final LoginRemoteDatasource _remoteDatasource =
      getIt<LoginRemoteDatasource>();

  @override
  Future<Either<Failure, void>> loginAccount(String email, String password) =>
      callDataSource(() => _remoteDatasource.loginAccount(email, password));
}
