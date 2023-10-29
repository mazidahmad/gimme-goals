import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/error/failures.dart';
import 'package:gimme_goals/features/startup/domain/usecases/initialize_amplify_configuration.dart';
import 'package:injectable/injectable.dart';

part 'startup_state.dart';

@Injectable()
class StartupCubit extends Cubit<StartupState> {
  StartupCubit() : super(StartupInitial());

  final InitializeAmplifyConfiguration _initializeAmplifyConfiguration =
      getIt<InitializeAmplifyConfiguration>();

  void initializeStartup() async {
    emit(StartupLoading());

    var result = await _initializeAmplifyConfiguration.execute();

    emit(
      result.fold(
        (failure) => StartupFailed(failure: failure),
        (_) => StartupLoaded(),
      ),
    );
  }
}
