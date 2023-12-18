import 'package:flutter/material.dart';

enum CardsAreaType { tasksContainer, areasContainer }

class CardsAreaModel extends ChangeNotifier {
  CardsAreaType type;
  Axis direction;
  List<CardsAreaModel> childAreas;

  CardsAreaModel({
    this.type = CardsAreaType.tasksContainer,
    this.direction = Axis.horizontal,
    this.childAreas = const [],
  });

  // Method to switch between tasks container and areas container
  void toggleType() {
    if (type == CardsAreaType.tasksContainer) {
      type = CardsAreaType.areasContainer;
    } else {
      type = CardsAreaType.tasksContainer;
    }
    notifyListeners(); // Notify listeners to rebuild the widget
  }

  // Add other methods as needed...
}
