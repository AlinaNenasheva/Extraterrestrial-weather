import 'dart:convert';

import 'package:extraterrestrial_weather/models/apod_dto.dart';
import 'package:extraterrestrial_weather/models/full_json_dto.dart';
import 'package:http/http.dart' as http;
import 'package:extraterrestrial_weather/models/sol_weather_dto.dart';

class ApiService {
  static const _WEATHER_URL = 'https://mars.nasa.gov/rss/api/?feed=weather&category=msl&feedtype=json';
  static const _APOD_URL = 'https://api.nasa.gov/planetary/apod?api_key=PXYcWWhNvgzhL0eeQRe9mmSNyKA7KmMugTeZCi0Y';

  Future<List<SolWeatherDto>> getWeather() async {
    final response = await http.get(Uri.parse
      (_WEATHER_URL));
    FullJsonDto fullJsonDto = FullJsonDto.fromApi(jsonDecode(response.body));
    return fullJsonDto.soles.sublist(0,7).map((e) => SolWeatherDto.fromApi(e)).toList();
  }

  Future<ApodDto> getPictureOfDay() async {
    final response = await http.get(Uri.parse
      (_APOD_URL));
    return ApodDto.fromApi(jsonDecode(response.body));
  }
}