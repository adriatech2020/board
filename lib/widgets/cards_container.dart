// lib/widgets/cards_container.dart
import 'package:flutter/material.dart';

class CardsContainer extends StatelessWidget {
  final String containerTitle; // Optional title for the container

  const CardsContainer({
    super.key,
    this.containerTitle = '', // Default to an empty string if no title provided
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (containerTitle.isNotEmpty) // Display title if provided
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                containerTitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          // Placeholder for future cards
        ],
      ),
    );
  }
}
