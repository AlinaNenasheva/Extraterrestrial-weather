import 'package:extraterrestrial_weather/consts/const_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  dynamic _getFromDisk(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value  =  prefs.get(key);
    return value;
  }

  void _saveToDisk<T>(String key, T content) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(content is String) {
      prefs.setString(key, content);
    }
    if(content is bool) {
      prefs.setBool(key, content);
    }
    if(content is int) {
      prefs.setInt(key, content);
    }
    if(content is double) {
      prefs.setDouble(key, content);
    }
    if(content is List<String>) {
      prefs.setStringList(key, content);
    }
  }


  Future<String> getCurrentLanguage() async {
    var value = await _getFromDisk(ConstKeys.current_language);
    return value ?? 'en';
}
  set currentLanguage(String selectedLanguage) => _saveToDisk(ConstKeys.current_language, selectedLanguage);
}