import 'package:history_malaysia/data/model/state_model.dart';

import '../../domain/entities/state_entity.dart';
import '../data_providers/state_api_provider.dart';

class StateRepository {
  final StateApiProvider apiProvider;

  StateRepository({required this.apiProvider});

  Future<List<StateEntity>> getAllStates() async {
    final List<StateModel> models = await apiProvider.fetchAllStates();
    return models.map((model) => model.toEntity()).toList();
  }

  Future<StateEntity> getStateDetail(String stateName) async {
    final StateModel model = await apiProvider.fetchStateDetail(stateName);
    return model.toEntity();
  }
}
