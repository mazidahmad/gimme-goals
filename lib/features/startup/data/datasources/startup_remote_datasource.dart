import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/network/amplify_module.dart';
import 'package:injectable/injectable.dart';

abstract class StartupRemoteDatasource {
  Future<void> initializeAmplifyConfiguration();
}

@Injectable(as: StartupRemoteDatasource)
class StartupRemoteDatasourceImpl extends StartupRemoteDatasource {
  final AmplifyModule amplifyConfigurator = getIt<AmplifyModule>();

  @override
  Future<void> initializeAmplifyConfiguration() async {
    await amplifyConfigurator.configureAmplify();
  }
}
