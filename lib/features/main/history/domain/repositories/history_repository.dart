import 'package:dartz/dartz.dart';
import 'package:gimme_goals/core/error/failures.dart';
import 'package:gimme_goals/features/global/data/models/body_mass_model.dart';

abstract class HistoryRepository {
  Future<Either<Failure, List<BodyMassModel>>> fetchHistories();
}
