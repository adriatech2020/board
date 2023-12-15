import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:board/widgets/board_column.dart';
import 'package:board/models/board_model.dart';
import 'package:board/models/board_column_model.dart';

class Board extends StatefulWidget {
  const Board({super.key});

  @override
  BoardState createState() => BoardState();
}

class BoardState extends State<Board> {
  bool _isEditMode = false;

  @override
  Widget build(BuildContext context) {
    final boardModel = Provider.of<BoardModel>(context);
    final config = boardModel.configuration;

    return Scaffold(
      appBar: AppBar(
        title: Text(config.title),
        actions: [
          IconButton(
            icon: Icon(_isEditMode ? Icons.check : Icons.edit),
            onPressed: _toggleEditMode,
            tooltip: _isEditMode ? 'Finish Editing' : 'Edit Layout',
          ),
        ],
      ),
      body: Container(
        color: config.backgroundColor,
        child: AnimatedList(
          key: boardModel.listKey,
          scrollDirection: Axis.horizontal,
          initialItemCount: config.columns.length + (_isEditMode ? 1 : 0),
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

  void _toggleEditMode() {
    setState(() {
      _isEditMode = !_isEditMode;
    });
    _updateList();
  }

  void _updateList() {
    final boardModel = Provider.of<BoardModel>(context, listen: false);
    if (_isEditMode) {
      boardModel.listKey.currentState?.insertItem(boardModel.configuration.columns.length);
    } else {
      boardModel.listKey.currentState?.removeItem(
        boardModel.configuration.columns.length,
        (context, animation) => _buildAddColumnButton(context),
      );
    }
  }

  Widget _buildAnimatedColumn(BoardColumnModel model, Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: BoardColumn(model: model),
    );
  }

  Widget _buildAddColumnButton(BuildContext context) {
    if (_isEditMode) {
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
    return const SizedBox.shrink();
  }
}
