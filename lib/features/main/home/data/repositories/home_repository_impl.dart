import 'package:dartz/dartz.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/error/failures.dart';
import 'package:gimme_goals/core/mixin/repository_mixin.dart';
import 'package:gimme_goals/features/global/data/models/body_mass_model.dart';
import 'package:gimme_goals/features/main/home/data/datasources/home_remote_datasource.dart';
import 'package:gimme_goals/features/main/home/domain/entity/body_mass_request.dart';
import 'package:gimme_goals/features/main/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository with RepositoryMixin {
  final HomeRemoteDatasource _remoteDatasource = getIt<HomeRemoteDatasource>();

  @override
  Future<Either<Failure, BodyMassModel?>> getTodayBodyMass() =>
      callDataSource(() => _remoteDatasource.getTodayBodyMass());

  @override
  Future<Either<Failure, void>> addBodyMass(BodyMassRequest bodyMass) =>
      callDataSource(
          () => _remoteDatasource.createTodayBodyMass(bodyMass.toModel()));
}