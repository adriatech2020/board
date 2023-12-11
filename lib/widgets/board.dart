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
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: config.columns.length,
          itemBuilder: (context, index) {
            var columnConfig = config.columns[index];
            var columnModel = BoardColumnModel();
            columnModel.updateConfiguration(columnConfig);
            return BoardColumn(model: columnModel);
          },
        ),
      ),
    );
  }
}
