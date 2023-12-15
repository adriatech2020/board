// lib/widgets/board.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:board/widgets/board_column.dart';
import 'package:board/models/board_model.dart';
import 'package:board/models/board_column_model.dart';

class Board extends StatelessWidget {
  const Board({super.key});

  @override
  Widget build(BuildContext context) {
    final boardModel = Provider.of<BoardModel>(context);
    final config = boardModel.configuration;

    return Scaffold(
      appBar: AppBar(
        title: Text(config.title),
      ),
      body: Container(
        color: config.backgroundColor,
        child: AnimatedList(
          key: boardModel.listKey,
          scrollDirection: Axis.horizontal,
          initialItemCount: config.columns.length + 1,
          itemBuilder: (context, index, animation) {
            if (index < config.columns.length) {
              var columnModel = BoardColumnModel();
              columnModel.updateConfiguration(config.columns[index]);
              return _buildAnimatedColumn(columnModel, animation);
            } else {
              return _buildAddColumnButton(context);
            }
          },
        ),
      ),
    );
  }

  Widget _buildAnimatedColumn(BoardColumnModel model, Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: BoardColumn(model: model),
    );
  }

  Widget _buildAddColumnButton(BuildContext context) {
    final boardModel = Provider.of<BoardModel>(context, listen: false);
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: OutlinedButton(
        onPressed: () => boardModel.addNewColumn(),
        child: const Text('Add Column'),
      ),
    );
  }
}
