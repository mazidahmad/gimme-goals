import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/error/failures.dart';
import 'package:gimme_goals/features/profile/domain/usecases/logout_user.dart';
import 'package:injectable/injectable.dart';

part 'profile_state.dart';

@Injectable()
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final LogoutUser _logoutUser = getIt<LogoutUser>();

  void logout() async {
    var result = await _logoutUser.execute();

    emit(
      result.fold(
        (failure) => ProfileFailed(failure: failure),
        (_) => ProfileLoggedOut(),
      ),
    );
  }
}
