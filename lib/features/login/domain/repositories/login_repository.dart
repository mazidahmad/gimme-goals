import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:dartz/dartz.dart';
import 'package:gimme_goals/core/error/failures.dart';

abstract class LoginRepository {
  Future<Either<Failure, SignInResult>> loginAccount(
      String email, String password);
}
