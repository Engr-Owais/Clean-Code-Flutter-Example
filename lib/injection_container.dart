import 'package:http/http.dart' as http;
import 'data/data_providers/state_api_provider.dart';
import 'data/repositories/state_repository.dart';
import 'presentation/blocs/state_bloc.dart';

class InjectionContainer {
  static final InjectionContainer _instance = InjectionContainer._internal();

  factory InjectionContainer() => _instance;

  InjectionContainer._internal();

  final http.Client httpClient = http.Client();
  late final StateApiProvider apiProvider =
      StateApiProvider(httpClient: httpClient);
  late final StateRepository repository =
      StateRepository(apiProvider: apiProvider);
  late final StateBloc stateBloc = StateBloc(repository: repository);
}
