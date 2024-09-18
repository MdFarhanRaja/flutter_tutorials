import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs {
  final IS_LOGIN = 'isLogin';

  Future<SharedPreferences> getPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    return Future.value(prefs);
  }

  void setIsLogin(bool v) async {
    final p = await getPreferences();
    await p.setBool(IS_LOGIN, v);
  }

  void logoutUser() async {
    final p = await getPreferences();
    await p.setBool(IS_LOGIN, false);
  }

  Future<bool> isLoggedin() async {
    final p = await getPreferences();
    final v = p.getBool(IS_LOGIN);
    return Future.value(v ?? false);
  }
}
