part of 'verification_code_cubit.dart';

class VerificationCodeState extends Equatable {
  const VerificationCodeState();

  @override
  List<Object> get props => [];
}

class VerificationCodeInitial extends VerificationCodeState {}

class VerificationCodeLoading extends VerificationCodeState {}

class VerificationCodeSuccess extends VerificationCodeState {}

class VerificationCodeFailed extends VerificationCodeState {
  final Failure failure;

  const VerificationCodeFailed({required this.failure});
}
