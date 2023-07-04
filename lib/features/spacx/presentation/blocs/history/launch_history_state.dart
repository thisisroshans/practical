part of 'launch_history_bloc.dart';

abstract class LaunchHistoryState extends Equatable {
  const LaunchHistoryState();
}

class LaunchHistoryInitial extends LaunchHistoryState {
  @override
  List<Object> get props => [];
}

class LaunchHistoryLoadedState extends LaunchHistoryState {
  const LaunchHistoryLoadedState(this.history);
  final List<LaunchHistory> history;
  @override
  List<Object> get props => [history];
}

class ErrorState extends LaunchHistoryState {
  const ErrorState(this.errors);
  final String errors;
  @override
  List<Object> get props => [errors];
}
