import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/error/failures.dart';
import 'package:gimme_goals/features/global/data/models/model_provider.dart';
import 'package:gimme_goals/features/main/home/domain/usecases/get_body_goal.dart';
import 'package:gimme_goals/features/main/home/domain/usecases/get_today_body_mass.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';

@Injectable()
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState(status: HomeStateStatus.initial));

  final GetTodayBodyMass _getTodayBodyMass = getIt<GetTodayBodyMass>();
  final GetBodyGoal _getBodyGoal = getIt<GetBodyGoal>();

  void getTodayBodyMass() async {
    emit(state.copyWith(status: HomeStateStatus.loading));

    var result = await _getTodayBodyMass.execute();

    emit(
      await result.fold(
        (failure) =>
            state.copyWith(status: HomeStateStatus.failed, failure: failure),
        (bodyMass) async {
          var resultGoal = await _getBodyGoal.execute();

          return resultGoal.fold(
            (failure) => state.copyWith(
                status: HomeStateStatus.failed, failure: failure),
            (goal) => state.copyWith(
                status: HomeStateStatus.loaded,
                todayBodyMass: bodyMass,
                goal: goal),
          );
        },
      ),
    );
  }
}
