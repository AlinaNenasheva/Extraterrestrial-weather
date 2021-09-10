class FullJsonDto {
  FullJsonDto.fromApi(Map<String, dynamic> map)
      :  soles = map['soles'];

  final List<dynamic> soles;
}
