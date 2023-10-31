import 'package:dartz/dartz.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/error/failures.dart';
import 'package:gimme_goals/core/mixin/repository_mixin.dart';
import 'package:gimme_goals/features/global/data/models/body_mass_model.dart';
import 'package:gimme_goals/features/global/data/models/goal_model.dart';
import 'package:gimme_goals/features/main/home/data/datasources/home_remote_datasource.dart';
import 'package:gimme_goals/features/main/home/domain/entity/body_goal_request.dart';
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

  @override
  Future<Either<Failure, GoalModel?>> getBodyGoal() =>
      callDataSource(() => _remoteDatasource.getBodyGoal());

  @override
  Future<Either<Failure, void>> addBodyGoal(BodyGoalRequest goal) =>
      callDataSource(() => _remoteDatasource.createBodyGoal(goal.toModel()));

  @override
  Future<Either<Failure, void>> updateBodyMass(BodyMassModel bodyMass) =>
      callDataSource(() => _remoteDatasource.updateBodyMass(bodyMass));

  @override
  Future<Either<Failure, void>> deleteBodyMass(BodyMassModel bodyMass) =>
      callDataSource(() => _remoteDatasource.deleteBodyMass(bodyMass));
}
