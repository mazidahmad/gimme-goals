import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/network/amplify_module.dart';
import 'package:injectable/injectable.dart';

abstract class ProfileRemoteDatasource {
  Future<void> logout();
}

@Injectable(as: ProfileRemoteDatasource)
class ProfileRemoteDatasourceImpl extends ProfileRemoteDatasource {
  final AmplifyModule _ampModule = getIt<AmplifyModule>();

  @override
  Future<void> logout() async {
    await _ampModule.amplify.Auth.signOut();
  }
}
