import 'package:intl/intl.dart';

class ApodDto {
  ApodDto.fromApi(Map<String, dynamic> map)
      : url = map['url'],
        date = DateTime.parse(map['date']),
        explanation = map['explanation'],
        title = map['title'];

  const ApodDto({this.date, this.url, this.explanation, this.title});

  final String? url;
  final DateTime? date;
  final String? explanation;
  final String? title;

  ApodDto copyWith({
    String? explanation,
    String? title,
  }) {
    return ApodDto(
      title: title ?? this.title,
      explanation: explanation ?? this.explanation,
    );
  }
}