// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

enum HomeStateStatus { initial, loading, loaded, failed }

class HomeState extends Equatable {
  final HomeStateStatus status;
  final BodyMassModel? todayBodyMass;
  final Failure? failure;

  const HomeState({required this.status, this.todayBodyMass, this.failure});

  @override
  List<Object?> get props => [status, todayBodyMass];

  HomeState copyWith({
    HomeStateStatus? status,
    BodyMassModel? todayBodyMass,
    Failure? failure,
  }) {
    return HomeState(
      status: status ?? this.status,
      todayBodyMass: todayBodyMass ?? this.todayBodyMass,
      failure: failure ?? this.failure,
    );
  }
}
