import 'package:flutter/cupertino.dart';

import '../services/dark_theme_prefs.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePrefs darkThemePrefs = DarkThemePrefs();

  bool darkTheme = false;
  bool get getDarkTheme => darkTheme;

  set setDarkTheme (bool value) {
    darkTheme = value;
    darkThemePrefs.setDarkTheme(value);
    notifyListeners();
  }
}
