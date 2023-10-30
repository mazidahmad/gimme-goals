import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/network/amplify_module.dart';
import 'package:injectable/injectable.dart';

abstract class LoginRemoteDatasource {
  Future<SignInResult> loginAccount(String email, String password);
}

@Injectable(as: LoginRemoteDatasource)
class LoginRemoteDatasourceImpl extends LoginRemoteDatasource {
  final AmplifyModule _ampModule = getIt<AmplifyModule>();

  @override
  Future<SignInResult> loginAccount(String email, String password) async {
    SignInResult response = await _ampModule.amplify.Auth
        .signIn(username: email, password: password);

    if (!response.isSignedIn) {
      throw const NetworkException(
          'Your account was troubled. Please contact Customer Service');
    }

    return response;
  }
}
