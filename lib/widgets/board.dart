// lib/widgets/board.dart
import 'package:board/widgets/board_column.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/board_model.dart';

class Board extends StatelessWidget {
  const Board({super.key});

  @override
  Widget build(BuildContext context) {
    final boardModel = Provider.of<BoardModel>(context);
    final config = boardModel.configuration;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kanban Board'),
      ),
      body: Container(
        color: config.backgroundColor,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: config.columns
                .map((columnConfig) => BoardColumn(title: columnConfig.title))
                .toList(),
          ),
        ),
      ),
    );
  }
}
