import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/state_repository.dart';
import 'state_event.dart';
import 'state_state.dart';

class StateBloc extends Bloc<StateEvent, StateState> {
  final StateRepository repository;

  StateBloc({required this.repository}) : super(StateInitial()) {
    on<FetchStates>(_onFetchStates);
    on<FetchStateDetail>(_onFetchStateDetail);
  }

  Future<void> _onFetchStates(
      FetchStates event, Emitter<StateState> emit) async {
    if (state is StateLoaded) {
      // If the states are already loaded, don't fetch again
      return;
    }

    emit(StateLoading());
    try {
      final states = await repository.getAllStates();
      emit(StateLoaded(states));
    } catch (e) {
      emit(StateError(e.toString()));
    }
  }

  Future<void> _onFetchStateDetail(
      FetchStateDetail event, Emitter<StateState> emit) async {
    emit(StateLoading());
    try {
      final stateDetail = await repository.getStateDetail(event.stateName);
      emit(StateDetailLoaded(stateDetail));
    } catch (e) {
      emit(StateError(e.toString()));
    }
  }
}
