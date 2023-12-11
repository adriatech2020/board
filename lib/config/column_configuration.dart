import 'package:flutter/material.dart';
import 'package:board/config/column_defaults.dart'; // Assuming Defaults contains default column configurations

class ColumnConfiguration {
  final String title;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final double borderRadius;
  final double elevation;

  ColumnConfiguration({
    required this.title,
    this.padding = const EdgeInsets.all(8.0),
    this.margin = const EdgeInsets.all(10.0),
    this.borderRadius = 10.0,
    this.elevation = 4.0,
  });

  // Method to merge custom config with default config
  static ColumnConfiguration getConfig([Map<String, dynamic>? customConfig]) {
    // Merge default config with custom config using spread operator
    Map<String, dynamic> mergedConfig = {
      ...Defaults.defaultColumnConfig, // Assuming this is defined in Defaults
      if (customConfig != null) ...customConfig,
    };

    // Create a ColumnConfiguration instance from the merged config
    return ColumnConfiguration(
      title: mergedConfig['title'] as String,
      padding: mergedConfig['padding'] as EdgeInsetsGeometry,
      margin: mergedConfig['margin'] as EdgeInsetsGeometry,
      borderRadius: mergedConfig['borderRadius'] as double,
      elevation: mergedConfig['elevation'] as double,
    );
  }
}