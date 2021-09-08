import 'package:intl/intl.dart';

class ApodDto {
  ApodDto.fromApi(Map<String, dynamic> map)
      : HDUrl = map['hdurl'],
        date = DateTime.parse(map['date']),
        explanation = map['explanation'],
        title = map['title'];

  final String HDUrl;
  final DateTime date;
  String explanation;
  String title;
}