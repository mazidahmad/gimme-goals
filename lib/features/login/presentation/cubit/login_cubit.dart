import 'package:equatable/equatable.dart';
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

  void loginAccount(String email, String password) async {
    emit(LoginLoading());

    var result = await _loginAccount.execute(email, password);

    emit(
      result.fold(
        (failure) => LoginFailed(failure: failure),
        (_) => LoginSuccess(),
      ),
    );
  }
}
