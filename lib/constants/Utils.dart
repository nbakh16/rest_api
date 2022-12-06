import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api/provider/dark_theme_provider.dart';

class Utils {
  BuildContext context;
  Utils(this.context);

  bool get getTheme => Provider.of<DarkThemeProvider>(context).getDarkTheme;

  Color get baseShimmerColor =>
      Theme.of(context).colorScheme.onSecondary;

  Color get highlightShimmerColor =>
      getTheme ? Colors.deepPurple.shade500 : Colors.green.shade300;

  Color get widgetShimmerColor =>
      getTheme ? Colors.deepPurple.shade600 : Colors.green.shade400;
}