// lib/models/board_model.dart
import 'package:flutter/foundation.dart';
import '../config/board_configuration.dart';

class BoardModel extends ChangeNotifier {
  // Initialize _configuration with default configuration
  BoardConfiguration _configuration = BoardConfiguration.getConfig();

  BoardConfiguration get configuration => _configuration;

  void updateConfiguration(BoardConfiguration newConfig) {
    _configuration = newConfig;
    notifyListeners();
  }
}
