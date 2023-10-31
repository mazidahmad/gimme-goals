part of 'cud_body_mass_cubit.dart';

enum CUDBodyMassStateStatus { initial, loading, loaded, failed, success }

class CUDBodyMassState extends Equatable {
  final CUDBodyMassStateStatus status;
  final double weight;
  final double height;
  final Failure? failure;

  const CUDBodyMassState(
      {required this.status,
      required this.weight,
      required this.height,
      this.failure});

  @override
  List<Object?> get props => [status, weight, height, failure];

  CUDBodyMassState copyWith({
    CUDBodyMassStateStatus? status,
    double? weight,
    double? height,
    Failure? failure,
  }) {
    return CUDBodyMassState(
      status: status ?? this.status,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      failure: failure ?? this.failure,
    );
  }
}
