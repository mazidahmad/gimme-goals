import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/error/failures.dart';
import 'package:gimme_goals/core/util/date_util.dart';
import 'package:gimme_goals/features/main/home/domain/entity/body_mass_request.dart';
import 'package:gimme_goals/features/main/home/domain/usecases/add_body_mass.dart';
import 'package:injectable/injectable.dart';

part 'add_body_mass_state.dart';

@Injectable()
class AddBodyMassCubit extends Cubit<AddBodyMassState> {
  AddBodyMassCubit()
      : super(const AddBodyMassState(
            status: AddBodyMassStateStatus.initial, weight: 60, height: 162));

  final AddBodyMass _addBodyMass = getIt<AddBodyMass>();

  void addBodyMass() async {
    emit(state.copyWith(status: AddBodyMassStateStatus.loading));

    var dataRequest = BodyMassRequest(
      weight: state.weight,
      height: state.height,
      date: TemporalDate.fromString(
        DateUtil.getSimpleFormattedDate(DateTime.now()),
      ),
    );

    var result = await _addBodyMass.execute(dataRequest);

    emit(
      result.fold(
        (failed) => state.copyWith(
            status: AddBodyMassStateStatus.failed, failure: failed),
        (_) => state.copyWith(status: AddBodyMassStateStatus.success),
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
