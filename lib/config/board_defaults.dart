import 'package:flutter/material.dart';
import 'package:board/config/column_configuration.dart';

class Defaults {
  // Default color for the board background
  static const Color boardBackgroundColor = Color(0xFFA7C7E7);

  // Default titles for the columns
  static const List<String> defaultColumnTitles = ['To Do', 'In Progress', 'Done'];

  // Function to generate default columns
  static List<ColumnConfiguration> getDefaultColumns() {
    return defaultColumnTitles
        .map((title) => ColumnConfiguration(title: title))
        .toList();
  }

  // Default Board Configuration
  static Map<String, dynamic> get defaultBoardConfig {
    return {
      'backgroundColor': boardBackgroundColor,
      'columns': getDefaultColumns(),
    };
  }
}
