import 'package:flutter/material.dart';

class GlobalTheme with ChangeNotifier {
  var darkTheme = Brightness.dark;
  var lightTheme = Brightness.light;
  var _globalTheme = Brightness.light;
  var _themeValue = 1;
  setTheme (int index) {
    _themeValue = index;
    switch (index) {
      case 0:
        _globalTheme = darkTheme;
        break;
      case 1:
        _globalTheme = lightTheme;
        break;
      default: 
        _globalTheme = lightTheme;
    }
    notifyListeners();
  }

  get theme => _globalTheme;
  get themeValue => _themeValue;
}