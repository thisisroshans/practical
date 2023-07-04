part of 'launches_bloc.dart';

abstract class LaunchesState extends Equatable {
  const LaunchesState();
}

class LaunchesInitial extends LaunchesState {
  @override
  List<Object> get props => [];
}

class LaunchesLoadedState extends LaunchesState {
  const LaunchesLoadedState(this.launches);
  final List<LaunchesModel> launches;
  @override
  List<Object> get props => [launches];
}

class ErrorState extends LaunchesState {
  const ErrorState(this.errors);
  final String errors;
  @override
  List<Object> get props => [errors];
}