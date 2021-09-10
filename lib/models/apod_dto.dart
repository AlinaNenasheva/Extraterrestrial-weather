import 'package:intl/intl.dart';

class ApodDto {
  ApodDto.fromApi(Map<String, dynamic> map)
      : url = map['url'],
        date = DateTime.parse(map['date']),
        explanation = map['explanation'],
        title = map['title'];

  final String url;
  final DateTime date;
  String explanation;
  String title;
}