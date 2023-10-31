import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:equatable/equatable.dart';
import 'package:gimme_goals/features/main/home/data/models/body_goal_request_model.dart';

class BodyGoalRequest extends Equatable {
  final double weight;
  final double height;

  const BodyGoalRequest({required this.weight, required this.height});

  @override
  List<Object?> get props => [weight, height];

  BodyGoalRequest copyWith({
    double? weight,
    double? height,
    TemporalDate? date,
  }) {
    return BodyGoalRequest(
      weight: weight ?? this.weight,
      height: height ?? this.height,
    );
  }

  BodyGoalRequestModel toModel() =>
      BodyGoalRequestModel(weight: weight, height: height);
}
