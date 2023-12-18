import 'package:board/models/board_column_model.dart';
import 'package:board/models/cards_area_model.dart';
import 'package:board/widgets/cards_area.dart';
import 'package:flutter/material.dart';

class BoardColumn extends StatelessWidget {
  final BoardColumnModel model;

  const BoardColumn({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    final config = model.configuration;
    final CardsArea defaultCardsArea = CardsArea(
      model: CardsAreaModel(), // Initialize with default model
    );

    return IntrinsicWidth(
      stepWidth: config.minWidth,
      child: Container(
        constraints: BoxConstraints(minWidth: config.minWidth),
        child: Card(
          elevation: config.elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(config.borderRadius),
          ),
          margin: config.margin,
          child: Padding(
            padding: config.padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  config.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 50,
                    maxHeight: double.infinity,
                  ),
                  child: defaultCardsArea,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
