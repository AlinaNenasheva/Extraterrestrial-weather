import 'dart:convert';

import 'package:extraterrestrial_weather/models/sol_weather_dto.dart';

class FullJsonDto {
  FullJsonDto.fromApi(Map<String, dynamic> map)
      :  soles = map['soles'];

  final List<dynamic> soles;
}
