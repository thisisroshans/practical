import 'dart:convert';

import '../../data/models/launch_history_model.dart';
import 'package:http/http.dart' as http;
class LaunchHistoryRepository {
  Future<List<LaunchHistory>> fetchLaunches() async {
    final response = await http.get(Uri.parse('https://api.spacexdata.com/v3/history'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print("===========>"+response.body);
      if (jsonData is List) {
        return jsonData.map((json) => LaunchHistory.fromJson(json)).toList();
      } else {
        throw Exception('Invalid API response format');
      }
    } else {
      throw Exception('Failed to fetch launches');
    }
  }
}


