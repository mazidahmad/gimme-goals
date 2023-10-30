import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/error/failures.dart';
import 'package:gimme_goals/features/verification/domain/usecases/verify_account.dart';
import 'package:injectable/injectable.dart';

part 'verification_code_state.dart';

@Injectable()
class VerificationCodeCubit extends Cubit<VerificationCodeState> {
  VerificationCodeCubit() : super(VerificationCodeInitial());

  final VerifyAccount _verifyAccount = getIt<VerifyAccount>();

  void verifyAccount(String code) async {
    emit(VerificationCodeLoading());

    var result = await _verifyAccount.execute(code);

    emit(
      result.fold(
        (failure) => VerificationCodeFailed(failure: failure),
        (_) => VerificationCodeSuccess(),
      ),
    );
  }
}
