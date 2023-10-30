import 'dart:convert';

import 'package:gimme_goals/features/verification/domain/entities/sign_up_session.dart';

class SignUpSessionModel extends SignUpSession {
  const SignUpSessionModel(
      {required super.email,
      super.id,
      required super.isCompleted,
      required super.nextStep});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'id': id,
      'isCompleted': isCompleted,
      'nextStep': nextStep,
    };
  }

  factory SignUpSessionModel.fromMap(Map<String, dynamic> map) {
    return SignUpSessionModel(
      email: map['email'] as String,
      id: map['id'] != null ? map['id'] as String : null,
      isCompleted: map['isCompleted'] as bool,
      nextStep: map['nextStep'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpSessionModel.fromJson(String source) =>
      SignUpSessionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
