import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class CacheData {
  static late SharedPreferences _sharedPreferences;

  static Future<void> cacheInitialization() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  /// setter
  static Future<bool> setData(
      {required String key, required dynamic value}) async {
    if (value is String) {
      await _sharedPreferences.setString(key, value);
      return true;
    }
    if (value is bool) {
      await _sharedPreferences.setBool(key, value);
      return true;
    }
    if (value is int) {
      await _sharedPreferences.setInt(key, value);
      return true;
    }
    if (value is double) {
      await _sharedPreferences.setDouble(key, value);
      return true;
    }
    return false;
  }

  /// getter
  static dynamic getData({required String key}) {
    return _sharedPreferences.get(key);
  }

  /// remover
  static void removeData({required String key}) {
    _sharedPreferences.remove(key);
  }
}
