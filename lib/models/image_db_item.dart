class ImageDbItem {
  ImageDbItem({
    required this.url,
    required this.date,
  });

  static final String tableName = "liked_image";
  static final String columnURL = "url";
  static final String columnDate = "date";

  String url;
  DateTime date;

  Map<String, dynamic> toMap() => {
    columnURL: url,
    columnDate: date.toString(),
  };

  ImageDbItem.fromMap(Map<String, dynamic> map)
        : this.url = map[columnURL],
         this.date = DateTime.parse(map[columnDate]);

  static List<ImageDbItem> fromMapList(List<dynamic> maps) => maps.map((i) => ImageDbItem.fromMap(i)).toList();

  static String create() => """
  CREATE TABLE $tableName ( 
      $columnURL TEXT UNIQUE NOT NULL,
      $columnDate TEXT UNIQUE NOT NULL
    )""";
}