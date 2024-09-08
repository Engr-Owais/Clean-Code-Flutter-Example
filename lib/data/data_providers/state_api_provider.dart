import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/state_model.dart';

class StateApiProvider {
  final http.Client httpClient;

  StateApiProvider({required this.httpClient});

  Future<List<StateModel>> fetchAllStates() async {
    final response = await httpClient.get(
      Uri.parse('https://jian.sh/malaysia-api/state/v1/all.json'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => StateModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load states');
    }
  }

  Future<StateModel> fetchStateDetail(String stateName) async {
    final response = await httpClient.get(
      Uri.parse(
          'https://jian.sh/malaysia-api/state/v1/${stateName.toLowerCase()}.json'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return StateModel.fromJson(data);
    } else {
      throw Exception('Failed to load state detail');
    }
  }
}
