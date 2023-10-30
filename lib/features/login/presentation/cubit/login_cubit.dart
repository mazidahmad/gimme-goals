import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/error/failures.dart';
import 'package:gimme_goals/features/login/domain/usecases/login_account.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';

@Injectable()
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final LoginAccount _loginAccount = getIt<LoginAccount>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void loginAccount() async {
    emit(LoginLoading());

    var result = await _loginAccount.execute(
        emailController.text, passwordController.text);

    emit(
      result.fold(
        (failure) => LoginFailed(failure: failure),
        (result) {
          switch (result.nextStep.signInStep) {
            case AuthSignInStep.confirmSignUp:
              return LoginConfirmSignUp();
            default:
              return LoginSuccess();
          }
        },
      ),
    );
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
