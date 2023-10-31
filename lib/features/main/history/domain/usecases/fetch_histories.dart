import 'package:dartz/dartz.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/error/failures.dart';
import 'package:gimme_goals/features/global/data/models/model_provider.dart';
import 'package:gimme_goals/features/main/history/domain/repositories/history_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class FetchHistories {
  final HistoryRepository _repo = getIt<HistoryRepository>();

  Future<Either<Failure, List<BodyMassModel>>> execute() =>
      _repo.fetchHistories();
}
