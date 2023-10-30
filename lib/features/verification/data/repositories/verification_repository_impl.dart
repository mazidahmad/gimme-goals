import 'package:dartz/dartz.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/error/failures.dart';
import 'package:gimme_goals/core/mixin/repository_mixin.dart';
import 'package:gimme_goals/features/verification/data/datasources/verification_local_datasource.dart';
import 'package:gimme_goals/features/verification/data/datasources/verification_remote_datasource.dart';
import 'package:gimme_goals/features/verification/domain/repositories/verification_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: VerificationRepository)
class VerificationRepositoryImpl extends VerificationRepository
    with RepositoryMixin {
  final VerificationLocalDatasource _localDatasource =
      getIt<VerificationLocalDatasource>();
  final VerificationRemoteDatasource _remoteDatasource =
      getIt<VerificationRemoteDatasource>();

  @override
  Future<Either<Failure, void>> verifyAccount(String code) =>
      callDataSource(() async {
        var signUpSession = await _localDatasource.fetchSignUpSession();

        if (signUpSession == null) {
          throw const DatabaseFailure('There is no sign up session');
        }

        return await _remoteDatasource.verifyAccount(signUpSession.email, code);
      });
}
