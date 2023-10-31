part of 'add_body_goal_cubit.dart';

enum AddBodyGoalStateStatus { initial, loading, loaded, failed, success }

class AddBodyGoalState extends Equatable {
  final AddBodyGoalStateStatus status;
  final double weight;
  final double height;
  final Failure? failure;

  const AddBodyGoalState(
      {required this.status,
      required this.weight,
      required this.height,
      this.failure});

  @override
  List<Object?> get props => [status, weight, height, failure];

  AddBodyGoalState copyWith({
    AddBodyGoalStateStatus? status,
    double? weight,
    double? height,
    Failure? failure,
  }) {
    return AddBodyGoalState(
      status: status ?? this.status,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      failure: failure ?? this.failure,
    );
  }
}
