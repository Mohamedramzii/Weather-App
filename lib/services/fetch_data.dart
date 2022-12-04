import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/weather_data_model/weather_data_model.dart';
import '../utils/constants.dart';

class Fetch_Data {
  WeatherDataModel? weathermodel;

  Future<WeatherDataModel> fetchData(lat, long) async {
    var response = await http.get(Uri.parse(apiUrl(lat, long)));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return WeatherDataModel.fromJson(jsonDecode(jsonString));
    } else {
      return throw Exception('Failed to load Data from server');
    }
  }

  String apiUrl(lat, long) {
    String url;
    url =
        'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$long&appid=$apikey&units=metric&exclude=minutely';
    return url;
  }
}
