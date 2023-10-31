// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

enum HomeStateStatus { initial, loading, loaded, failed }

class HomeState extends Equatable {
  final HomeStateStatus status;
  final BodyMassModel? todayBodyMass;
  final GoalModel? goal;
  final Failure? failure;

  const HomeState(
      {required this.status, this.todayBodyMass, this.failure, this.goal});

  @override
  List<Object?> get props => [status, todayBodyMass, goal, failure];

  HomeState copyWith({
    HomeStateStatus? status,
    BodyMassModel? todayBodyMass,
    GoalModel? goal,
    Failure? failure,
  }) {
    return HomeState(
      status: status ?? this.status,
      todayBodyMass: todayBodyMass ?? this.todayBodyMass,
      goal: goal ?? this.goal,
      failure: failure ?? this.failure,
    );
  }
}
