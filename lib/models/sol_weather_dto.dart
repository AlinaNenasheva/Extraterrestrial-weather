import 'package:extraterrestrial_weather/services/shared_service.dart';
import 'package:intl/intl.dart';

class SolWeatherDto {
  SolWeatherDto.fromApi(Map<String, dynamic> map)
      : sol = int.parse(map['sol']),
        terrestrialDate = DateTime.parse(map['terrestrial_date']),
        pressure = int.parse(map['pressure']),
        pressureStatus = map['pressure_string'],
        highCelsius = int.parse(map['max_temp']),
        lowCelsius = int.parse(map['min_temp']),
        sunrise = map['sunrise'],
        sunset = map['sunset'];

  final int sol;
  final DateTime terrestrialDate;
  final int pressure;
  final String pressureStatus;
  final int highCelsius;
  final int lowCelsius;
  final String sunrise;
  final String sunset;
}