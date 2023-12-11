import 'package:flutter/material.dart';
import 'package:board/config/column_configuration.dart';
import 'package:board/config/board_defaults.dart';

class BoardConfiguration {
  final Color backgroundColor;
  final List<ColumnConfiguration> columns;

  BoardConfiguration({required this.backgroundColor, required this.columns});

  // Method to merge custom config with default config
  static BoardConfiguration getConfig([Map<String, dynamic>? customConfig]) {
    // Merge default config with custom config using spread operator
    Map<String, dynamic> mergedConfig = {
      ...Defaults.defaultBoardConfig,
      if (customConfig != null) ...customConfig,
    };

    // Create a BoardConfiguration instance from the merged config
    return BoardConfiguration(
      backgroundColor: mergedConfig['backgroundColor'] as Color,
      columns: mergedConfig['columns'] as List<ColumnConfiguration>,
    );
  }
}
