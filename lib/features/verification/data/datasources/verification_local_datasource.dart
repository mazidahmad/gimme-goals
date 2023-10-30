import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/storage/local_storage.dart';
import 'package:gimme_goals/features/verification/data/models/sign_up_session_model.dart';
import 'package:injectable/injectable.dart';

abstract class VerificationLocalDatasource {
  Future<SignUpSessionModel?> fetchSignUpSession();
}

@Injectable(as: VerificationLocalDatasource)
class VerificationLocalDatasourceImpl extends VerificationLocalDatasource {
  final LocalStorage _storage = getIt<LocalStorage>();

  @override
  Future<SignUpSessionModel?> fetchSignUpSession() async {
    var data = await _storage.read('account', 'signup');
    if (data != null) {
      return SignUpSessionModel.fromJson(data);
    }
    return null;
  }
}
