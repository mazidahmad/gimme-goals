import 'package:dartz/dartz.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/error/failures.dart';
import 'package:gimme_goals/features/global/data/models/model_provider.dart';
import 'package:gimme_goals/features/main/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class UpdateBodyGoal {
  final HomeRepository _repo = getIt<HomeRepository>();

  Future<Either<Failure, void>> execute(GoalModel goal) =>
      _repo.updateBodyGoal(goal);
}
