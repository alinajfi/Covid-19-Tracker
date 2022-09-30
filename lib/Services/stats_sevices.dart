import 'dart:convert';

import 'package:covid_tracker/Models/world_report.dart';
import 'package:http/http.dart';

class StatsServices {
  Future<WorldReport> fetWorldStats() async {
    //  print('sdjflksjffls');
    //'https://disease.sh/v3/covid-19/all'
    Response response =
        await get(Uri.parse('https://disease.sh/v3/covid-19/all'));
    print(response.statusCode);

    if (response.statusCode == 200) {
      return WorldReport.fromJson(response.body);
    } else {
      print('else of response'); //ok? ok
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> fetchCountreisStats() async {
    var data;

    Response response =
        await get(Uri.parse('https://disease.sh/v3/covid-19/countries'));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Error');
    }
  }
}
