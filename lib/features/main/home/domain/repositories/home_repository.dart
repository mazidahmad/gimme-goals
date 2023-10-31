import 'package:dartz/dartz.dart';
import 'package:gimme_goals/core/error/failures.dart';
import 'package:gimme_goals/features/global/data/models/model_provider.dart';
import 'package:gimme_goals/features/main/home/domain/entity/body_mass_request.dart';

abstract class HomeRepository {
  Future<Either<Failure, BodyMassModel?>> getTodayBodyMass();
  Future<Either<Failure, void>> addBodyMass(BodyMassRequest bodyMass);
}
