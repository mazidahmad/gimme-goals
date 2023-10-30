import 'dart:convert';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/storage/local_storage.dart';
import 'package:injectable/injectable.dart';

abstract class RegisterLocalDatasource {
  Future<void> saveSignUpSession(String email, SignUpResult result);
}

@Injectable(as: RegisterLocalDatasource)
class RegisterLocalDatasourceImpl extends RegisterLocalDatasource {
  final LocalStorage _storage = getIt<LocalStorage>();

  @override
  Future<void> saveSignUpSession(String email, SignUpResult result) async {
    var data = {
      'id': result.userId,
      'email': email,
      'is_complete': result.isSignUpComplete,
      'nextStep': result.nextStep.signUpStep.name,
    };

    await _storage.save('account', 'signup', jsonEncode(data));
  }
}
