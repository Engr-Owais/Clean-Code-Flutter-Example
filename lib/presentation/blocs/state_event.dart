import 'package:equatable/equatable.dart';

abstract class StateEvent extends Equatable {
  const StateEvent();

  @override
  List<Object?> get props => [];
}

class FetchStates extends StateEvent {}

class FetchStateDetail extends StateEvent {
  final String stateName;

  const FetchStateDetail(this.stateName);

  @override
  List<Object?> get props => [stateName];
}
