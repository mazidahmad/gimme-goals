import 'package:dartz/dartz.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/error/failures.dart';
import 'package:gimme_goals/features/startup/domain/repositories/startup_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class InitializeAmplifyConfiguration {
  final StartupRepository _repo = getIt<StartupRepository>();

  Future<Either<Failure, void>> execute() =>
      _repo.initializeAmplifyConfiguration();
}
