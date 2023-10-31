part of 'cu_body_goal_cubit.dart';

enum CUBodyGoalStateStatus { initial, loading, loaded, failed, success }

class CUBodyGoalState extends Equatable {
  final CUBodyGoalStateStatus status;
  final double weight;
  final double height;
  final Failure? failure;

  const CUBodyGoalState(
      {required this.status,
      required this.weight,
      required this.height,
      this.failure});

  @override
  List<Object?> get props => [status, weight, height, failure];

  CUBodyGoalState copyWith({
    CUBodyGoalStateStatus? status,
    double? weight,
    double? height,
    Failure? failure,
  }) {
    return CUBodyGoalState(
      status: status ?? this.status,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      failure: failure ?? this.failure,
    );
  }
}
