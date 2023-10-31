import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/error/failures.dart';
import 'package:gimme_goals/features/global/data/models/model_provider.dart';
import 'package:gimme_goals/features/main/history/domain/usecases/fetch_histories.dart';
import 'package:injectable/injectable.dart';

part 'history_state.dart';

@Injectable()
class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(HistoryInitial());

  final FetchHistories _fetchHistories = getIt<FetchHistories>();

  void fetchHistories() async {
    emit(HistoryLoading());

    var result = await _fetchHistories.execute();

    emit(
      result.fold(
        (failure) => HistoryFailed(failure: failure),
        (data) => HistoryLoaded(histories: data),
      ),
    );
  }
}
