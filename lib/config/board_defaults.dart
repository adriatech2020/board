import 'package:flutter/material.dart';
import 'package:board/config/column_configuration.dart';

class Defaults {
  static const String boardTitle = 'New Board';
  static const Color boardBackgroundColor = Color(0xFFA7C7E7);
  static const List<String> defaultColumnTitles = ['To Do', 'In Progress', 'Done'];
  static List<ColumnConfiguration> getDefaultColumns() {
    return defaultColumnTitles
        .map((title) => ColumnConfiguration(title: title))
        .toList();
  }

  // Default Board Configuration
  static Map<String, dynamic> get defaultBoardConfig {
    return {
      'title': boardTitle,
      'backgroundColor': boardBackgroundColor,
      'columns': getDefaultColumns(),
    };
  }
}
