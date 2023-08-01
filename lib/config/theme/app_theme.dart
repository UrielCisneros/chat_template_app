import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(0, 85, 4, 172);

const List<Color> _colorThemes = [
  _customColor,
  Colors.black,
  Colors.blue,
  Colors.green,
  Colors.yellow
];

class AppTheme {
  final int selecterColor;
  final Brightness brightness;

  AppTheme({required this.selecterColor, this.brightness = Brightness.light})
      : assert(selecterColor > -1 && selecterColor <= _colorThemes.length - 1,
            "Color must e between 0 and ${_colorThemes.length - 1}");

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: _colorThemes[selecterColor],
        brightness: brightness);
  }
}
