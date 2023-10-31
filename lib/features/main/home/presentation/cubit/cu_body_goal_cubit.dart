import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/error/failures.dart';
import 'package:gimme_goals/features/global/data/models/goal_model.dart';
import 'package:gimme_goals/features/main/home/domain/entity/body_goal_request.dart';
import 'package:gimme_goals/features/main/home/domain/usecases/add_body_goal.dart';
import 'package:gimme_goals/features/main/home/domain/usecases/update_body_goal.dart';
import 'package:injectable/injectable.dart';

part 'cu_body_goal_state.dart';

@Injectable()
class CUBodyGoalCubit extends Cubit<CUBodyGoalState> {
  CUBodyGoalCubit()
      : super(const CUBodyGoalState(
            status: CUBodyGoalStateStatus.initial, weight: 60, height: 162));

  final AddBodyGoal _addBodyGoal = getIt<AddBodyGoal>();
  final UpdateBodyGoal _updateBodyGoal = getIt<UpdateBodyGoal>();

  void initialize(GoalModel? goal) {
    emit(state.copyWith(height: goal?.height, weight: goal?.weight));
  }

  void addBodyGoal() async {
    emit(state.copyWith(status: CUBodyGoalStateStatus.loading));

    var dataRequest = BodyGoalRequest(
      weight: state.weight,
      height: state.height,
    );

    var result = await _addBodyGoal.execute(dataRequest);

    emit(
      result.fold(
        (failed) => state.copyWith(
            status: CUBodyGoalStateStatus.failed, failure: failed),
        (_) => state.copyWith(status: CUBodyGoalStateStatus.success),
      ),
    );
  }

  void updateBodyGoal(GoalModel goal) async {
    emit(state.copyWith(status: CUBodyGoalStateStatus.loading));

    var dataRequest = goal.copyWith(
      weight: state.weight,
      height: state.height,
    );

    var result = await _updateBodyGoal.execute(dataRequest);

    emit(
      result.fold(
        (failed) => state.copyWith(
            status: CUBodyGoalStateStatus.failed, failure: failed),
        (_) => state.copyWith(status: CUBodyGoalStateStatus.success),
      ),
    );
  }

  void changeWeight(double weight) {
    emit(state.copyWith(weight: weight));
  }

  void changeHeight(double height) {
    emit(state.copyWith(height: height));
  }
}
