import 'package:flutter/material.dart';
import 'package:board/models/board_column_model.dart';

class BoardColumn extends StatelessWidget {
  final BoardColumnModel model;
  final List<Widget> cardsContainers;

  const BoardColumn({
    super.key,
    required this.model,
    this.cardsContainers = const [],
  });

  @override
  Widget build(BuildContext context) {
    // Access configuration from the model
    final config = model.configuration;

    return Card(
      elevation: config.elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(config.borderRadius),
      ),
      margin: config.margin,
      child: Padding(
        padding: config.padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              config.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            ...cardsContainers, // Your existing cards containers
          ],
        ),
      ),
    );
  }
}
