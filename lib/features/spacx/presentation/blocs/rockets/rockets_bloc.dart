import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/launches_model.dart';
import '../../../domain/repositories/rockets_repository.dart';

part 'rockets_event.dart';
part 'rockets_state.dart';

class RocketsBloc extends Bloc<RocketsEvent, RocketsState> {
  final RocketsRepository _rocketsRepository;
  RocketsBloc(this._rocketsRepository) : super(RocketsInitial()) {
    on<RocketsEvent>((event, emit) async{
      emit((RocketsInitial()));
      try{
        final rocketsDetail = await _rocketsRepository.fetchRockets();
        emit(RocketsLoadedState(rocketsDetail));
      }
      catch(e){
        emit(ErrorState(e.toString()));
      }
    });
  }
}
