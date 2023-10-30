import 'package:dartz/dartz.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/error/failures.dart';
import 'package:gimme_goals/core/mixin/repository_mixin.dart';
import 'package:gimme_goals/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:gimme_goals/features/profile/domain/repositories/profile_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl extends ProfileRepository with RepositoryMixin {
  final ProfileRemoteDatasource _remoteDatasource =
      getIt<ProfileRemoteDatasource>();

  @override
  Future<Either<Failure, void>> logout() =>
      callDataSource(() => _remoteDatasource.logout());
}
