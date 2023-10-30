import 'package:equatable/equatable.dart';

class SignUpSession extends Equatable {
  final String email;
  final String? id;
  final bool isCompleted;
  final String nextStep;

  const SignUpSession(
      {required this.email,
      this.id,
      required this.isCompleted,
      required this.nextStep});

  @override
  List<Object?> get props => [email, id, isCompleted, nextStep];

  SignUpSession copyWith({
    String? email,
    String? id,
    bool? isCompleted,
    String? nextStep,
  }) {
    return SignUpSession(
      email: email ?? this.email,
      id: id ?? this.id,
      isCompleted: isCompleted ?? this.isCompleted,
      nextStep: nextStep ?? this.nextStep,
    );
  }
}
