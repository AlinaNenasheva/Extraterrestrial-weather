import 'dart:convert';

import 'package:extraterrestrial_weather/models/full_json_dto.dart';
import 'package:http/http.dart' as http;
import 'package:extraterrestrial_weather/models/sol_weather_dto.dart';

class ApiService {
  static const _BASE_URL = 'https://mars.nasa.gov/rss/api/?feed=weather&category=msl&feedtype=json';

  Future<List<SolWeatherDto>> getWeather() async {
    final response = await http.get(Uri.parse
      ('https://mars.nasa.gov/rss/api/?feed=weather&category=msl&feedtype=json'));
    FullJsonDto fullJsonDto = FullJsonDto.fromApi(jsonDecode(response.body));
    List<SolWeatherDto> solWeatherDto = [];
    return fullJsonDto.soles.sublist(0,7).map((e) => SolWeatherDto.fromApi(e)).toList();
  }
}