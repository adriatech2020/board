import 'package:flutter/material.dart';
import 'package:board/config/column_defaults.dart';
import 'package:uuid/uuid.dart';

class ColumnConfiguration {
  final String id;
  final String title;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final double borderRadius;
  final double elevation;
  final double minWidth;

  ColumnConfiguration({
    String? id,
    required this.title,
    this.padding = Defaults.defaultColumnPadding,
    this.margin = Defaults.defaultColumnMargin,
    this.borderRadius = Defaults.defaultColumnBorderRadius,
    this.elevation = Defaults.defaultColumnElevation,
    this.minWidth = Defaults.defaultColumnMinWidth,
  }) : id = id ?? _generateColumnId();

  static String _generateColumnId() {
    var uuid = const Uuid();
    return '${DateTime.now().millisecondsSinceEpoch}-${uuid.v4()}';
  }

  // Method to merge custom config with default config
  static ColumnConfiguration getConfig([Map<String, dynamic>? customConfig]) {
    // Merge default config with custom config using spread operator
    Map<String, dynamic> mergedConfig = {
      ...Defaults.defaultColumnConfig,
      if (customConfig != null) ...customConfig,
    };

    // Create a ColumnConfiguration instance from the merged config
    return ColumnConfiguration(
      title: mergedConfig['title'] as String,
      padding: mergedConfig['padding'] as EdgeInsetsGeometry,
      margin: mergedConfig['margin'] as EdgeInsetsGeometry,
      borderRadius: mergedConfig['borderRadius'] as double,
      elevation: mergedConfig['elevation'] as double,
      minWidth: mergedConfig['minWidth'] as double,
      id: mergedConfig['id'] as String?,
    );
  }
}
