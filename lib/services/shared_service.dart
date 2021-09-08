import 'package:extraterrestrial_weather/consts/const_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  static SharedService? _instance;
  static SharedPreferences? _preferences;

  static Future<SharedService?> getInstance() async {
    if (_instance == null) {
      _instance = SharedService();
    }

    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }

    return _instance;
  }

  dynamic _getFromDisk(String key) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    var value  =  _preferences!.get(key);
    return value;
  }

  void _saveToDisk<T>(String key, T content) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    if(content is String) {
      _preferences!.setString(key, content);
    }
    if(content is bool) {
      _preferences!.setBool(key, content);
    }
    if(content is int) {
      _preferences!.setInt(key, content);
    }
    if(content is double) {
      _preferences!.setDouble(key, content);
    }
    if(content is List<String>) {
      _preferences!.setStringList(key, content);
    }
  }


  Future<String> getCurrentLanguage() async {
    var value = await _getFromDisk(ConstKeys.current_language);
    return value ?? 'en';
}
  set currentLanguage(String selectedLanguage) => _saveToDisk(ConstKeys.current_language, selectedLanguage);
}