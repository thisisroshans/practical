import 'dart:convert';

import 'package:practical_tdd/features/spacx/data/models/launches_model.dart';

import '../../data/models/launch_history_model.dart';
import 'package:http/http.dart' as http;
class LaunchesRepository {
  Future<List<LaunchesModel>> fetchDetails() async {
    final response = await http.get(Uri.parse('https://api.spacexdata.com/v3/launches'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print("---------->"+response.body);
      if (jsonData is List) {
        return jsonData.map((json) => LaunchesModel.fromJson(json)).toList();
      } else {
        throw Exception('Invalid API response format');
      }
    } else {
      throw Exception('Failed to fetch launches');
    }
  }
}