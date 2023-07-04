import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:practical_tdd/features/spacx/domain/repositories/launch_history_repository.dart';

import '../../../data/models/launch_history_model.dart';


part 'launch_history_event.dart';
part 'launch_history_state.dart';

class LaunchHistoryBloc extends Bloc<LaunchHistoryEvent, LaunchHistoryState> {
  final LaunchHistoryRepository _launchHistoryRepository;
  LaunchHistoryBloc(this._launchHistoryRepository) : super(LaunchHistoryInitial()) {
    on<LaunchHistoryEvent>((event, emit) async{
      emit((LaunchHistoryInitial()));
      try{
        final history = await _launchHistoryRepository.fetchLaunches();
        emit(LaunchHistoryLoadedState(history));
      }
      catch(e){
      emit(ErrorState(e.toString()));
      }
    //  emit(LaunchHistoryLoadedState());
    });
  }
}
