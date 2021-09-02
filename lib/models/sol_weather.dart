import 'package:extraterrestrial_weather/models/sol_weather_dto.dart';

class SolWeather {
  SolWeather({
    required this.sol,
    required this.terrestrialDate,
    required this.pressure,
    required this.pressureStatus,
    required this.highCelsius,
    required this.lowCelsius,
    required this.sunrise,
    required this.sunset,
  });

  final int sol;
  final String terrestrialDate;
  final int pressure;
  final String pressureStatus;
  final int highCelsius;
  final int lowCelsius;
  final String sunrise;
  final String sunset;

}