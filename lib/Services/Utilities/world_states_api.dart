import 'dart:convert';

import 'package:covid_tracker_app/Models/WorldStatsModel.dart';
import 'package:covid_tracker_app/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

class WorldStatesapi {
  Future<WorldStatsModel> FetchWorldStatesRecords() async {
    final response = await http.get(Uri.parse(AppUrl.baseurl));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatsModel.fromJson(data);
    } else {
      throw Exception('error');
    }
  }
}
