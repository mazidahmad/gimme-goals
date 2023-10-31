import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:equatable/equatable.dart';
import 'package:gimme_goals/features/main/home/data/models/body_mass_request_model.dart';

class BodyMassRequest extends Equatable {
  final double weight;
  final double height;
  final TemporalDate date;

  const BodyMassRequest(
      {required this.weight, required this.height, required this.date});

  @override
  List<Object?> get props => [weight, height, date];

  BodyMassRequest copyWith({
    double? weight,
    double? height,
    TemporalDate? date,
  }) {
    return BodyMassRequest(
      weight: weight ?? this.weight,
      height: height ?? this.height,
      date: date ?? this.date,
    );
  }

  BodyMassRequestModel toModel() =>
      BodyMassRequestModel(weight: weight, height: height, date: date);
}
