import 'package:flutter/material.dart';

class ThemeStyles{
  static ThemeData themeData(BuildContext context, bool isDark){
    return ThemeData(
      scaffoldBackgroundColor: isDark ? Colors.black45 : Colors.white,
      appBarTheme: AppBarTheme(color: isDark ? Colors.black45 : Colors.white),

      primaryColor: isDark ? Colors.deepPurple : Colors.lightGreen,

      colorScheme: ThemeData().colorScheme.copyWith(
        secondary: isDark ? Colors.blueGrey : Colors.deepPurple,
        onSecondary: isDark ? Color(0xff291056) : Color(0xff396209),
        brightness: isDark ? Brightness.dark : Brightness.light,
      ),

      cardColor: isDark ? Colors.deepPurple : Colors.lightGreen,
      canvasColor: isDark ? Colors.black26 : Colors.white,

      buttonTheme: Theme.of(context).buttonTheme.copyWith(
        colorScheme: isDark ? const ColorScheme.dark() : const ColorScheme.light()
      )
    );
  }
}