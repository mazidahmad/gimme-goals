import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/network/amplify_module.dart';
import 'package:gimme_goals/features/global/data/models/model_provider.dart';
import 'package:injectable/injectable.dart';

abstract class HistoryRemoteDatasource {
  Future<List<BodyMassModel>> getHistories();
}

@Injectable(as: HistoryRemoteDatasource)
class HistoryRemoteDatasourceImpl extends HistoryRemoteDatasource {
  final AmplifyModule _ampModule = getIt<AmplifyModule>();
  final APIAuthorizationType _authType = APIAuthorizationType.userPools;

  @override
  Future<List<BodyMassModel>> getHistories() async {
    var session = await _ampModule.amplify.Auth.fetchAuthSession();

    var dataSession = session.toJson();

    CognitoUserPoolTokens tokens =
        dataSession['userPoolTokens'] as CognitoUserPoolTokens;

    var request = ModelQueries.list<BodyMassModel>(
      BodyMassModel.classType,
      authorizationMode: _authType,
      headers: {'Authorization': 'Bearer ${tokens.accessToken.raw}'},
    );
    var operation = _ampModule.amplify.API.query(request: request);
    var response = await operation.response;
    if (response.data != null && response.data!.items.isNotEmpty) {
      return response.data!.items.map((element) => element!).toList();
    }
    return [];
  }
}
