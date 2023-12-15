import 'package:flutter/material.dart';
import 'package:board/config/column_configuration.dart';
import 'package:board/config/board_defaults.dart';
import 'package:uuid/uuid.dart';

class BoardConfiguration {
  final String id;
  final String title;
  final Color backgroundColor;
  final List<ColumnConfiguration> columns;

  BoardConfiguration({
    String? id,
    required this.title,
    required this.backgroundColor,
    required this.columns,
  }): id = id ?? _generateBoardId();

  static String _generateBoardId() {
    var uuid = const Uuid();
    return '${DateTime.now().millisecondsSinceEpoch}-${uuid.v4()}';
  }

  // Method to merge custom config with default config
  static BoardConfiguration getConfig([Map<String, dynamic>? customConfig]) {
    // Merge default config with custom config using spread operator
    Map<String, dynamic> mergedConfig = {
      ...Defaults.defaultBoardConfig,
      if (customConfig != null) ...customConfig,
    };

    // Create a BoardConfiguration instance from the merged config
    return BoardConfiguration(
      title: mergedConfig['title'] as String,
      backgroundColor: mergedConfig['backgroundColor'] as Color,
      columns: mergedConfig['columns'] as List<ColumnConfiguration>,
    );
  }
}
