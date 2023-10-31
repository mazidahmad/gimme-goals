import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/error/failures.dart';
import 'package:gimme_goals/core/util/date_util.dart';
import 'package:gimme_goals/features/global/data/models/model_provider.dart';
import 'package:gimme_goals/features/main/home/domain/entity/body_mass_request.dart';
import 'package:gimme_goals/features/main/home/domain/usecases/add_body_mass.dart';
import 'package:gimme_goals/features/main/home/domain/usecases/delete_body_mass.dart';
import 'package:gimme_goals/features/main/home/domain/usecases/update_body_mass.dart';
import 'package:injectable/injectable.dart';

part 'cud_body_mass_state.dart';

@Injectable()
class CUDBodyMassCubit extends Cubit<CUDBodyMassState> {
  CUDBodyMassCubit()
      : super(const CUDBodyMassState(
            status: CUDBodyMassStateStatus.initial, weight: 60, height: 162));

  final AddBodyMass _addBodyMass = getIt<AddBodyMass>();
  final UpdateBodyMass _updateBodyMass = getIt<UpdateBodyMass>();
  final DeleteBodyMass _deleteBodyMass = getIt<DeleteBodyMass>();

  void initialize(BodyMassModel? bodyMass) async {
    emit(
      state.copyWith(
        status: CUDBodyMassStateStatus.initial,
        height: bodyMass != null ? bodyMass.height : 172,
        weight: bodyMass != null ? bodyMass.weight : 62,
      ),
    );
  }

  void addBodyMass() async {
    emit(state.copyWith(status: CUDBodyMassStateStatus.loading));

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
            status: CUDBodyMassStateStatus.failed, failure: failed),
        (_) => state.copyWith(status: CUDBodyMassStateStatus.success),
      ),
    );
  }

  void updateBodyMass(BodyMassModel bodyMass) async {
    emit(state.copyWith(status: CUDBodyMassStateStatus.loading));

    var dataRequest = bodyMass.copyWith(
      weight: state.weight,
      height: state.height,
    );

    var result = await _updateBodyMass.execute(dataRequest);

    emit(
      result.fold(
        (failed) => state.copyWith(
            status: CUDBodyMassStateStatus.failed, failure: failed),
        (_) => state.copyWith(status: CUDBodyMassStateStatus.success),
      ),
    );
  }

  void deleteBodyMass(BodyMassModel bodyMass) async {
    emit(state.copyWith(status: CUDBodyMassStateStatus.loading));

    var result = await _deleteBodyMass.execute(bodyMass);

    emit(
      result.fold(
        (failed) => state.copyWith(
            status: CUDBodyMassStateStatus.failed, failure: failed),
        (_) => state.copyWith(status: CUDBodyMassStateStatus.success),
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
