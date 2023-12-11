// lib/widgets/board_column.dart
import 'package:flutter/material.dart';
// Import CardsContainer widget

class BoardColumn extends StatelessWidget {
  final String title;
  final List<Widget> cardsContainers; // List of CardsContainer widgets

  const BoardColumn({
    super.key,
    required this.title,
    this.cardsContainers = const [], // Initialize with an empty list by default
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          ...cardsContainers, // Spread operator to add all CardsContainer widgets
        ],
      ),
    );
  }
}
