part of 'add_body_mass_cubit.dart';

enum AddBodyMassStateStatus { initial, loading, loaded, failed, success }

class AddBodyMassState extends Equatable {
  final AddBodyMassStateStatus status;
  final double weight;
  final double height;
  final Failure? failure;

  const AddBodyMassState(
      {required this.status,
      required this.weight,
      required this.height,
      this.failure});

  @override
  List<Object?> get props => [status, weight, height, failure];

  AddBodyMassState copyWith({
    AddBodyMassStateStatus? status,
    double? weight,
    double? height,
    Failure? failure,
  }) {
    return AddBodyMassState(
      status: status ?? this.status,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      failure: failure ?? this.failure,
    );
  }
}
