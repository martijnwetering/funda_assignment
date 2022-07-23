import 'package:flutter/material.dart';

const kYellow = Color(0xFFf7a100);
const kLightBlue = Color(0xFFe6f2f7);
const kDarkBlue = Color(0xFF0071b3);

const _colorScheme = ColorScheme.light(
  primary: kYellow,
  secondary: kLightBlue,
  secondaryContainer: kDarkBlue,
);

final appTheme = ThemeData.from(colorScheme: _colorScheme).copyWith(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    backgroundColor: kLightBlue,
  ),
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    filled: true,
    fillColor: Colors.white,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: Colors.grey),
    ),
    labelStyle: const TextStyle(
        // color: Colors.white,
        ),
  ),
);
