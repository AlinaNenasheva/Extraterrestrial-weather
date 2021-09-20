import 'dart:convert';
import 'package:extraterrestrial_weather/services/api_service/models/apod_dto.dart';
import 'package:extraterrestrial_weather/services/api_service/models/sol_weather_with_descriptions_dto.dart';
import 'package:http/http.dart' as http;
import 'package:extraterrestrial_weather/services/api_service/models/sol_weather_dto.dart';

class ApiService {
  static const weather_url =
      'https://mars.nasa.gov/rss/api/?feed=weather&category=msl&feedtype=json';
  static const apod_url =
      'https://api.nasa.gov/planetary/apod?api_key=PXYcWWhNvgzhL0eeQRe9mmSNyKA7KmMugTeZCi0Y';

  Future<List<SolWeatherDto>> getWeather() async {
    final response = await http.get(Uri.parse(weather_url));
    SolWeatherWithDescriptionsDto fullJsonDto = SolWeatherWithDescriptionsDto.fromApi(jsonDecode(response.body));
    return fullJsonDto.soles
        .sublist(0, 7)
        .map((e) => SolWeatherDto.fromApi(e))
        .toList();
  }

  Future<ApodDto> getPictureOfDay() async {
    final response = await http.get(Uri.parse(apod_url));
    return ApodDto.fromApi(jsonDecode(response.body));
  }
}
