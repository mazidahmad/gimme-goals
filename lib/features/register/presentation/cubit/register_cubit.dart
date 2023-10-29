import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/error/failures.dart';
import 'package:gimme_goals/features/register/domain/usecases/signup_account.dart';
import 'package:injectable/injectable.dart';

part 'register_state.dart';

@Injectable()
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final SignUpAccount _signUp = getIt<SignUpAccount>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();

  void registerAccount() async {
    emit(RegisterLoading());

    var result =
        await _signUp.execute(emailController.text, passwordController.text);

    emit(
      result.fold(
        (failure) => RegisterFailed(failure: failure),
        (_) => RegisterSuccess(),
      ),
    );
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
  }
}
