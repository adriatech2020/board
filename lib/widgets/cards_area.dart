import 'package:board/models/cards_area_model.dart';
import 'package:board/models/edit_mode_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardsArea extends StatefulWidget {
  final CardsAreaModel model;

  const CardsArea({super.key, required this.model});

  @override
  // ignore: library_private_types_in_public_api
  _CardsAreaState createState() => _CardsAreaState();
}

class _CardsAreaState extends State<CardsArea> {
  @override
  Widget build(BuildContext context) {
    final isEditMode = Provider.of<EditModeModel>(context).isEditMode;

    // Main container with decoration and constraints
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey, // Color of the border
          style: BorderStyle.solid, // Dotted style if available
        ),
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      constraints: const BoxConstraints(minHeight: 50), // Minimum height
      child: Stack(
        children: [
          widget.model.type == CardsAreaType.tasksContainer
              ? _buildTasksContainer()
              : _buildAreasContainer(),
          if (isEditMode) _buildAddRowButton(), // Show button in edit mode
        ],
      ),
    );
  }

  Widget _buildTasksContainer() {
    // Placeholder for task cards container
    return const Center(child: Text('Tasks Container'));
  }

  Widget _buildAreasContainer() {
    return widget.model.direction == Axis.vertical
        ? SingleChildScrollView(
            child: Column(
              children: widget.model.childAreas
                  .map((childModel) => CardsArea(model: childModel))
                  .toList(),
            ),
          )
        : Row(
            children: widget.model.childAreas
                .map((childModel) =>
                    Expanded(child: CardsArea(model: childModel)))
                .toList(),
          );
  }

  Widget _buildAddRowButton() {
    return Positioned(
      right: 10,
      bottom: 10,
      child: ElevatedButton(
        onPressed: () => _handleAddRowAction(),
        child: const Text('Add row'),
      ),
    );
  }

  void _handleAddRowAction() {
    widget.model.addRow();
    setState(() {});
  }
}
