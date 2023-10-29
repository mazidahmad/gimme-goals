import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/network/amplify_module.dart';
import 'package:injectable/injectable.dart';

abstract class RegisterRemoteDatasource {
  Future<void> registerAccount(String email, String password);
}

@Injectable(as: RegisterRemoteDatasource)
class RegisterRemoteDatasourceImpl extends RegisterRemoteDatasource {
  final AmplifyModule _ampModule = getIt<AmplifyModule>();

  @override
  Future<void> registerAccount(String email, String password) async {
    await _ampModule.amplify.Auth.signUp(
      username: email,
      password: password,
      options: SignUpOptions(
        userAttributes: {
          AuthUserAttributeKey.email: email,
        },
      ),
    );
  }
}
