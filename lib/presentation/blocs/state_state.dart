import 'package:equatable/equatable.dart';
import '../../domain/entities/state_entity.dart';

abstract class StateState extends Equatable {
  const StateState();

  @override
  List<Object?> get props => [];
}

class StateInitial extends StateState {}

class StateLoading extends StateState {}

class StateLoaded extends StateState {
  final List<StateEntity> states;

  const StateLoaded(this.states);

  @override
  List<Object?> get props => [states];
}

class StateDetailLoaded extends StateState {
  final StateEntity stateDetail;

  const StateDetailLoaded(this.stateDetail);

  @override
  List<Object?> get props => [stateDetail];
}

class StateError extends StateState {
  final String message;

  const StateError(this.message);

  @override
  List<Object?> get props => [message];
}
