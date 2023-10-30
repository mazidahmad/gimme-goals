part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {}

class ProfileLoggedOut extends ProfileState {}

class ProfileFailed extends ProfileState {
  final Failure failure;

  const ProfileFailed({required this.failure});
}
