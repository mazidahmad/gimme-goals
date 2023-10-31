import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/network/amplify_module.dart';
import 'package:gimme_goals/features/global/data/models/model_provider.dart';
import 'package:gimme_goals/features/main/home/data/models/body_goal_request_model.dart';
import 'package:gimme_goals/features/main/home/data/models/body_mass_request_model.dart';
import 'package:injectable/injectable.dart';

abstract class HomeRemoteDatasource {
  Future<BodyMassModel?> getTodayBodyMass();
  Future<GoalModel?> getBodyGoal();
  Future<void> createTodayBodyMass(BodyMassRequestModel bodyMass);
  Future<void> updateBodyMass(BodyMassModel bodyMass);
  Future<void> deleteBodyMass(BodyMassModel bodyMass);
  Future<void> createBodyGoal(BodyGoalRequestModel goal);
}

@Injectable(as: HomeRemoteDatasource)
class HomeRemoteDatasourceImpl extends HomeRemoteDatasource {
  final AmplifyModule _ampModule = getIt<AmplifyModule>();
  final APIAuthorizationType _authType = APIAuthorizationType.userPools;

  @override
  Future<BodyMassModel?> getTodayBodyMass() async {
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
      return response.data?.items.first;
    }
    return null;
  }

  @override
  Future<void> createTodayBodyMass(BodyMassRequestModel bodyMass) async {
    try {
      var currUser = await _ampModule.amplify.Auth.getCurrentUser();

      var session = await _ampModule.amplify.Auth.fetchAuthSession();

      var dataSession = session.toJson();

      CognitoUserPoolTokens tokens =
          dataSession['userPoolTokens'] as CognitoUserPoolTokens;

      final model = BodyMassModel(
          user_id: currUser.userId,
          height: bodyMass.height,
          weight: bodyMass.weight,
          date: bodyMass.date);

      final request = ModelMutations.create(model,
          authorizationMode: _authType,
          headers: {'Authorization': 'Bearer ${tokens.accessToken.raw}'});

      final response =
          await _ampModule.amplify.API.mutate(request: request).response;

      final createdGoalModel = response.data;
      if (createdGoalModel == null) {
        throw NetworkException('errors: ${response.errors}');
      }
    } on ApiException catch (e) {
      throw NetworkException('Mutation failed: ${e.message}');
    }
  }

  @override
  Future<GoalModel?> getBodyGoal() async {
    var session = await _ampModule.amplify.Auth.fetchAuthSession();

    var dataSession = session.toJson();

    CognitoUserPoolTokens tokens =
        dataSession['userPoolTokens'] as CognitoUserPoolTokens;

    var request = ModelQueries.list<GoalModel>(
      GoalModel.classType,
      authorizationMode: _authType,
      headers: {'Authorization': 'Bearer ${tokens.accessToken.raw}'},
    );
    var operation = _ampModule.amplify.API.query(request: request);
    var response = await operation.response;
    if (response.data != null && response.data!.items.isNotEmpty) {
      return response.data?.items.first;
    }
    return null;
  }

  @override
  Future<void> createBodyGoal(BodyGoalRequestModel goal) async {
    try {
      var currUser = await _ampModule.amplify.Auth.getCurrentUser();

      var session = await _ampModule.amplify.Auth.fetchAuthSession();

      var dataSession = session.toJson();

      CognitoUserPoolTokens tokens =
          dataSession['userPoolTokens'] as CognitoUserPoolTokens;

      final model = GoalModel(
        user_id: currUser.userId,
        height: goal.height,
        weight: goal.weight,
      );

      final request = ModelMutations.create(model,
          authorizationMode: _authType,
          headers: {'Authorization': 'Bearer ${tokens.accessToken.raw}'});

      final response =
          await _ampModule.amplify.API.mutate(request: request).response;

      final createdGoalModel = response.data;
      if (createdGoalModel == null) {
        throw NetworkException('errors: ${response.errors}');
      }
    } on ApiException catch (e) {
      throw NetworkException('Mutation failed: ${e.message}');
    }
  }

  @override
  Future<void> updateBodyMass(BodyMassModel bodyMass) async {
    try {
      var session = await _ampModule.amplify.Auth.fetchAuthSession();
      var dataSession = session.toJson();

      CognitoUserPoolTokens tokens =
          dataSession['userPoolTokens'] as CognitoUserPoolTokens;

      final request = ModelMutations.update(bodyMass,
          authorizationMode: _authType,
          headers: {'Authorization': 'Bearer ${tokens.accessToken.raw}'});

      final response =
          await _ampModule.amplify.API.mutate(request: request).response;

      final updateBodyMass = response.data;
      if (updateBodyMass == null) {
        throw NetworkException('errors: ${response.errors}');
      }
    } on ApiException catch (e) {
      throw NetworkException('Mutation failed: ${e.message}');
    }
  }

  @override
  Future<void> deleteBodyMass(BodyMassModel bodyMass) async {
    try {
      var session = await _ampModule.amplify.Auth.fetchAuthSession();
      var dataSession = session.toJson();

      CognitoUserPoolTokens tokens =
          dataSession['userPoolTokens'] as CognitoUserPoolTokens;

      final request = ModelMutations.delete(bodyMass,
          authorizationMode: _authType,
          headers: {'Authorization': 'Bearer ${tokens.accessToken.raw}'});

      final response =
          await _ampModule.amplify.API.mutate(request: request).response;

      if (response.hasErrors) {
        throw NetworkException('errors: ${response.errors}');
      }
    } on ApiException catch (e) {
      throw NetworkException('Mutation failed: ${e.message}');
    }
  }
}
