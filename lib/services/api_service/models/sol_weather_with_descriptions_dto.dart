class SolWeatherWithDescriptionsDto {
  SolWeatherWithDescriptionsDto.fromApi(Map<String, dynamic> map)
      :  soles = map['soles'];

  final List<dynamic> soles;
}
