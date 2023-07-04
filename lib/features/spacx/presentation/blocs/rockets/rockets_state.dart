part of 'rockets_bloc.dart';

abstract class RocketsState extends Equatable {
  const RocketsState();
}

class RocketsInitial extends RocketsState {
  @override
  List<Object> get props => [];
}

class RocketsLoadedState extends RocketsState {
  const RocketsLoadedState(this.launches);
  final List<LaunchesModel> launches;
  @override
  List<Object> get props => [launches];
}

class ErrorState extends RocketsState {
  const ErrorState(this.errors);
  final String errors;
  @override
  List<Object> get props => [errors];
}