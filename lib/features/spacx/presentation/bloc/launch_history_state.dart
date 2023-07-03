part of 'launch_history_bloc.dart';

abstract class LaunchHistoryState extends Equatable {
  const LaunchHistoryState();
}

class LaunchHistoryInitial extends LaunchHistoryState {
  @override
  List<Object> get props => [];
}
