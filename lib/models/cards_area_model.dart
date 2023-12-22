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

  // Method to add new row with a new child area
  void addRow() {
    if (type == CardsAreaType.tasksContainer) {
      _convertToAreasContainer();
    } else {
      // Additional logic for adding a new AreasContainer inside an areas container will be added later
    }
    notifyListeners();
  }

  void _convertToAreasContainer() {
    type = CardsAreaType.areasContainer;
    direction = Axis.vertical;
    childAreas = [
      CardsAreaModel(), // First child area
      CardsAreaModel(), // Second child area
    ];
  }

  // Add other methods as needed...
}
