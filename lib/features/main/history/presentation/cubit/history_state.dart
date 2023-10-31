part of 'history_cubit.dart';

class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object> get props => [];
}

class HistoryInitial extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistoryLoaded extends HistoryState {
  final List<BodyMassModel> histories;

  const HistoryLoaded({required this.histories});
}

class HistoryFailed extends HistoryState {
  final Failure failure;

  const HistoryFailed({required this.failure});
}
