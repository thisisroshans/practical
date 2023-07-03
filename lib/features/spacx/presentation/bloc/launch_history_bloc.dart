import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'launch_history_event.dart';
part 'launch_history_state.dart';

class LaunchHistoryBloc extends Bloc<LaunchHistoryEvent, LaunchHistoryState> {
  LaunchHistoryBloc() : super(LaunchHistoryInitial()) {
    on<LaunchHistoryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
