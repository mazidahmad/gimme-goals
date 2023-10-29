// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

import 'package:gimme_goals/amplifyconfiguration.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class AmplifyModule {
  final AmplifyClass amplify = Amplify;
  final AmplifyAuthCognito auth = AmplifyAuthCognito();
  final AmplifyAnalyticsPinpoint analytics = AmplifyAnalyticsPinpoint();

  Future<void> configureAmplify() async {
    try {
      await amplify.addPlugins([auth, analytics]);
      await amplify.configure(amplifyconfig);
    } catch (e) {
      throw const NetworkException('Error when initialize Amplify');
    }
  }
}
