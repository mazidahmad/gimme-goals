import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gimme_goals/core/network/amplify_module.dart';
import 'package:gimme_goals/features/main/home/data/datasources/home_remote_datasource.dart';
import 'package:gimme_goals/features/main/home/data/models/body_mass_request_model.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../helpers/mock_module.dart';
import '../../../../../helpers/test_injection.dart';

void main() {
  late HomeRemoteDatasource datasource;
  late AmplifyModule mockAmplifyModule;
  late AmplifyClass mockAmplifyClass;

  setUpAll(
    () {
      mockAmplifyModule = MockAmplifyModule();
      mockAmplifyClass = MockAmplify();
      registerTestFactory<AmplifyModule>(mockAmplifyModule);
      datasource = HomeRemoteDatasourceImpl();
    },
  );

  group(
    'Add Body Mass',
    () {
      var mockAuthUser = const AuthUser(
        userId: 'useId',
        username: 'username',
        signInDetails: CognitoSignInDetails.apiBased(username: 'username'),
      );
      var mockPoolsToken = CognitoUserPoolTokens(
        refreshToken: "asduaiudgasdasdasd",
        idToken: JsonWebToken.parse("ougfaoufgaougfoausgdosuahdosafs"),
        accessToken: JsonWebToken.parse("doausdghuoafgausofgasoufgsao"),
      );
      var mockAuthSession = CognitoAuthSession(
        identityIdResult: const AWSResult.success('identity'),
        userPoolTokensResult: AWSResult.success(mockPoolsToken),
        isSignedIn: true,
        credentialsResult: const AWSResult.success(
            AWSCredentials("accessKeyId", "secretAccessKey")),
        userSubResult: const AWSResult.success("user"),
      );

      var requestData = BodyMassRequestModel(
          height: 150,
          weight: 50,
          date: TemporalDate.fromString(
              DateTime.parse("2020-01-01").toIso8601String()));

      test(
        'should success add body mass when done',
        () async {
          when(() => mockAmplifyModule.amplify).thenReturn(mockAmplifyClass);
          when(() => mockAmplifyClass.Auth.getCurrentUser())
              .thenAnswer((_) async => mockAuthUser);
          when(() => mockAmplifyClass.Auth.fetchAuthSession())
              .thenAnswer((_) async => mockAuthSession);

          await datasource.createTodayBodyMass(requestData);
        },
      );
    },
  );
}
