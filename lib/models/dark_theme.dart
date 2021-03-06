import 'package:flutter/material.dart';
import 'package:todoey/utilities/shared_preferences.dart';

class DarkThemeData extends ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();

  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(_darkTheme);
    notifyListeners();
  }
}
