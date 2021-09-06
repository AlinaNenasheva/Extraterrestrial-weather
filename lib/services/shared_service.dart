import 'package:extraterrestrial_weather/consts/const_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedService {

  dynamic _getFromDisk(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var value  =  prefs.get(key);
    print('(TRACE) LocalStorageService:_getFromDisk. key: $key value: $value');
    return value;
  }

  void _saveToDisk<T>(String key, T content) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print('(TRACE) LocalStorageService:_saveStringToDisk. key: $key value: $content');
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