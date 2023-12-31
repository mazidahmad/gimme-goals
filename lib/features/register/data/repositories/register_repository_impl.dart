import 'package:dartz/dartz.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/error/failures.dart';
import 'package:gimme_goals/core/mixin/repository_mixin.dart';
import 'package:gimme_goals/features/register/data/datasources/register_remote_datasource.dart';
import 'package:gimme_goals/features/register/domain/repositories/register_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RegisterRepository)
class RegisterRepositoryImpl extends RegisterRepository with RepositoryMixin {
  final RegisterRemoteDatasource _remoteDatasource =
      getIt<RegisterRemoteDatasource>();

  @override
  Future<Either<Failure, void>> registerAccount(
          String email, String password) =>
      callDataSource(() => _remoteDatasource.registerAccount(email, password));
}
