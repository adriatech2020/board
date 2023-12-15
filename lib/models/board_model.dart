// lib/models/board_model.dart
import 'package:flutter/material.dart';
import '../config/board_configuration.dart';
import '../config/column_configuration.dart'; // Import ColumnConfiguration

class BoardModel extends ChangeNotifier {
  BoardConfiguration _configuration = BoardConfiguration.getConfig();

  BoardConfiguration get configuration => _configuration;
  final listKey = GlobalKey<AnimatedListState>();

  void updateConfiguration(BoardConfiguration newConfig) {
    _configuration = newConfig;
    notifyListeners();
  }

  void addNewColumn() {
    var newColumn = ColumnConfiguration.getConfig();
    _configuration.columns.add(newColumn);
    listKey.currentState?.insertItem(_configuration.columns.length - 1); 
    notifyListeners();
  }
}
