// lib/models/board_model.dart
import 'package:board/config/column_configuration.dart';
import 'package:flutter/foundation.dart';

class BoardColumnModel extends ChangeNotifier {
  // Initialize _configuration with default configuration
  ColumnConfiguration _configuration = ColumnConfiguration.getConfig();

  ColumnConfiguration get configuration => _configuration;

  void updateConfiguration(ColumnConfiguration newConfig) {
    _configuration = newConfig;
    notifyListeners();
  }
}
