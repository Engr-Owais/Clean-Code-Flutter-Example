import 'package:equatable/equatable.dart';

class StateEntity extends Equatable {
  final String name;
  final String capital;
  final int population;

  StateEntity({
    required this.name,
    required this.capital,
    required this.population,
  });

  @override
  List<Object?> get props => [name, capital, population];
}
