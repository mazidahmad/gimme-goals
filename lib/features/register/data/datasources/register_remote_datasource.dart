import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/error/network_exception.dart';
import 'package:gimme_goals/core/network/amplify_module.dart';
import 'package:injectable/injectable.dart';

abstract class RegisterRemoteDatasource {
  Future<SignUpResult> registerAccount(String email, String password);
}

@Injectable(as: RegisterRemoteDatasource)
class RegisterRemoteDatasourceImpl extends RegisterRemoteDatasource {
  final AmplifyModule _ampModule = getIt<AmplifyModule>();

  @override
  Future<SignUpResult> registerAccount(String email, String password) async {
    try {
      return await _ampModule.amplify.Auth.signUp(
        username: email,
        password: password,
        options: SignUpOptions(
          userAttributes: {
            AuthUserAttributeKey.email: email,
          },
        ),
      );
    } on UsernameExistsException catch (_) {
      throw const RequestException('Register',
          errMessage:
              'Account already registered, please use another email or login with the email');
    } catch (e) {
      rethrow;
    }
  }
}
