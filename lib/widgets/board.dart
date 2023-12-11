import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:board/widgets/board_column.dart';
import 'package:board/models/board_model.dart';
import 'package:board/models/board_column_model.dart'; // Import BoardColumnModel

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
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: config.columns.map((columnConfig) {
              var columnModel = BoardColumnModel(); // Create BoardColumnModel
              columnModel.updateConfiguration(columnConfig); // Update configuration
              return BoardColumn(model: columnModel); // Pass BoardColumnModel to BoardColumn
            }).toList(),
          ),
        ),
      ),
    );
  }
}

