import 'package:dartz/dartz.dart';
import 'package:gimme_goals/core/error/failures.dart';
import 'package:gimme_goals/features/global/data/models/model_provider.dart';
import 'package:gimme_goals/features/main/home/domain/entity/body_goal_request.dart';
import 'package:gimme_goals/features/main/home/domain/entity/body_mass_request.dart';

abstract class HomeRepository {
  Future<Either<Failure, BodyMassModel?>> getTodayBodyMass();
  Future<Either<Failure, GoalModel?>> getBodyGoal();
  Future<Either<Failure, void>> addBodyMass(BodyMassRequest bodyMass);
  Future<Either<Failure, void>> updateBodyMass(BodyMassModel bodyMass);
  Future<Either<Failure, void>> deleteBodyMass(BodyMassModel bodyMass);
  Future<Either<Failure, void>> addBodyGoal(BodyGoalRequest goal);
  Future<Either<Failure, void>> updateBodyGoal(GoalModel goal);
}
