import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/network/amplify_module.dart';
import 'package:injectable/injectable.dart';

abstract class VerificationRemoteDatasource {
  Future<void> verifyAccount(String email, String code);
}

@Injectable(as: VerificationRemoteDatasource)
class VerificationRemoteDatasourceImpl extends VerificationRemoteDatasource {
  final AmplifyModule _ampModule = getIt<AmplifyModule>();

  @override
  Future<void> verifyAccount(String email, String code) async {
    var result = await _ampModule.amplify.Auth
        .confirmSignUp(username: email, confirmationCode: code);

    if (!result.isSignUpComplete) {
      throw const NetworkException('Verification Account Failed');
    }
  }
}
