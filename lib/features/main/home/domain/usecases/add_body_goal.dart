import 'package:dartz/dartz.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/error/failures.dart';
import 'package:gimme_goals/features/main/home/domain/entity/body_goal_request.dart';
import 'package:gimme_goals/features/main/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class AddBodyGoal {
  final HomeRepository _repo = getIt<HomeRepository>();

  Future<Either<Failure, void>> execute(BodyGoalRequest goal) =>
      _repo.addBodyGoal(goal);
}
