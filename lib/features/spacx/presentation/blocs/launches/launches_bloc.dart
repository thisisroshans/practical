import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:practical_tdd/features/spacx/data/models/launches_model.dart';

import '../../../domain/repositories/launches_repository.dart';

part 'launches_event.dart';
part 'launches_state.dart';

class LaunchesBloc extends Bloc<LaunchesEvent, LaunchesState> {
  final LaunchesRepository _launchesRepository;
  LaunchesBloc(this._launchesRepository) : super(LaunchesInitial()) {
  on<LaunchesEvent>((event, emit) async{
  emit((LaunchesInitial()));
  try{
  final launches = await _launchesRepository.fetchDetails();
  emit(LaunchesLoadedState(launches));
  }
  catch(e){
  emit(ErrorState(e.toString()));
  }
  //  emit(LaunchHistoryLoadedState());
  });
  }
  }
