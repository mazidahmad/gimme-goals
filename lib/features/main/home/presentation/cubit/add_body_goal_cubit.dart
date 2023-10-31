import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/error/failures.dart';
import 'package:gimme_goals/features/main/home/domain/entity/body_goal_request.dart';
import 'package:gimme_goals/features/main/home/domain/usecases/add_body_goal.dart';
import 'package:injectable/injectable.dart';

part 'add_body_goal_state.dart';

@Injectable()
class AddBodyGoalCubit extends Cubit<AddBodyGoalState> {
  AddBodyGoalCubit()
      : super(const AddBodyGoalState(
            status: AddBodyGoalStateStatus.initial, weight: 60, height: 162));

  final AddBodyGoal _addBodyGoal = getIt<AddBodyGoal>();

  void addBodyGoal() async {
    emit(state.copyWith(status: AddBodyGoalStateStatus.loading));

    var dataRequest = BodyGoalRequest(
      weight: state.weight,
      height: state.height,
    );

    var result = await _addBodyGoal.execute(dataRequest);

    emit(
      result.fold(
        (failed) => state.copyWith(
            status: AddBodyGoalStateStatus.failed, failure: failed),
        (_) => state.copyWith(status: AddBodyGoalStateStatus.success),
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
