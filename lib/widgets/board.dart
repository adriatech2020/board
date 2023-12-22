import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:board/widgets/board_column.dart';
import 'package:board/models/board_model.dart';
import 'package:board/models/board_column_model.dart';
import 'package:board/models/edit_mode_model.dart'; // Import EditModeModel

class Board extends StatefulWidget {
  const Board({super.key});

  @override
  BoardState createState() => BoardState();
}

class BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    final boardModel = Provider.of<BoardModel>(context);
    final config = boardModel.configuration;
    final editModeModel = Provider.of<EditModeModel>(context); // Access EditModeModel

    return Scaffold(
      appBar: AppBar(
        title: Text(config.title),
        actions: [
          ElevatedButton.icon(
            onPressed: () => editModeModel.toggleEditMode(), // Toggle edit mode using EditModeModel
            icon: Icon(editModeModel.isEditMode ? Icons.check : Icons.edit),
            label: Text(editModeModel.isEditMode ? 'Finish Editing' : 'Edit Layout'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
            ),
          ),
        ],
      ),
      body: Container(
        color: config.backgroundColor,
        child: AnimatedList(
          key: boardModel.listKey,
          scrollDirection: Axis.horizontal,
          initialItemCount: config.columns.length + (editModeModel.isEditMode ? 1 : 0),
          itemBuilder: (context, index, animation) {
            if (index < config.columns.length) {
              var columnModel = BoardColumnModel();
              columnModel.updateConfiguration(config.columns[index]);
              return _buildAnimatedColumn(columnModel, animation);
            } else {
              return editModeModel.isEditMode ? _buildAddColumnButton(context) : const SizedBox.shrink();
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
