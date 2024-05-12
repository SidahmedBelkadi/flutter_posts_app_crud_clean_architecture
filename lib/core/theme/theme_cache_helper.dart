import 'package:posts_app/core/constants/keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ThemeCacheHelper {
  static Future<void> cacheThemeIndex(int themeIndex) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(AppKeys.themeIndex, themeIndex);
  }

  static Future<int> getCachedThemeIndex() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final cachedThemeIndex = sharedPreferences.getInt(AppKeys.themeIndex);
    if (cachedThemeIndex != null) {
      return cachedThemeIndex;
    } else {
      return 0;
    }
  }
}
