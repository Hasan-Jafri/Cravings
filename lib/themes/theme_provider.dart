import 'package:cravings/themes/dark_mode.dart';
import 'package:cravings/themes/light_mode.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightmode;

  ThemeData get themeData => _themeData;
  bool get isDarkMode => _themeData == darktmode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightmode) {
      themeData = darktmode;
    } else {
      themeData = lightmode;
    }
  }
}
