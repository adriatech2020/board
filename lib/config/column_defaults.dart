import 'package:flutter/material.dart';

class Defaults {
  // Existing board defaults
  static const Color boardBackgroundColor = Colors.white;
  // ... other board defaults

  // Default settings for columns
  static const String defaultColumnTitle = 'New Column';
  static const EdgeInsets defaultColumnPadding = EdgeInsets.all(8.0);
  static const EdgeInsets defaultColumnMargin = EdgeInsets.all(10.0);
  static const double defaultColumnBorderRadius = 10.0;
  static const double defaultColumnElevation = 4.0;

  // Default Column Configuration
  static Map<String, dynamic> get defaultColumnConfig {
    return {
      'title': defaultColumnTitle,
      'padding': defaultColumnPadding,
      'margin': defaultColumnMargin,
      'borderRadius': defaultColumnBorderRadius,
      'elevation': defaultColumnElevation,
    };
  }
}
