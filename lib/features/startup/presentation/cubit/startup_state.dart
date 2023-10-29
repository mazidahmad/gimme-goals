part of 'startup_cubit.dart';

class StartupState extends Equatable {
  const StartupState();

  @override
  List<Object> get props => [];
}

class StartupInitial extends StartupState {}

class StartupLoading extends StartupState {}

class StartupLoggedIn extends StartupState {}

class StartupLoaded extends StartupState {}

class StartupFailed extends StartupState {
  final Failure failure;

  const StartupFailed({required this.failure});
}
