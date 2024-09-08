import 'package:equatable/equatable.dart';
import '../../domain/entities/state_entity.dart';

class StateModel extends Equatable {
  final String name;
  final String capital;
  final int population;

  StateModel({
    required this.name,
    required this.capital,
    required this.population,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      name: json['state'] ?? '',
      capital: json['capital'] ?? '',
      population: json['population'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'state': name,
        'capital': capital,
        'population': population,
      };

  StateEntity toEntity() {
    return StateEntity(
      name: name,
      capital: capital,
      population: population,
    );
  }

  @override
  List<Object?> get props => [name, capital, population];
}
