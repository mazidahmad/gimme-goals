import 'package:dartz/dartz.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/error/failures.dart';
import 'package:gimme_goals/core/mixin/repository_mixin.dart';
import 'package:gimme_goals/features/global/data/models/body_mass_model.dart';
import 'package:gimme_goals/features/main/history/data/datasources/history_remote_datasource.dart';
import 'package:gimme_goals/features/main/history/domain/repositories/history_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HistoryRepository)
class HistoryRepositoryImpl extends HistoryRepository with RepositoryMixin {
  final HistoryRemoteDatasource _remoteDatasource =
      getIt<HistoryRemoteDatasource>();

  @override
  Future<Either<Failure, List<BodyMassModel>>> fetchHistories() =>
      callDataSource(() => _remoteDatasource.getHistories());
}
