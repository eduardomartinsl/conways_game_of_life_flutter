import 'package:conways_game_of_life/models/Board.dart';
import 'package:conways_game_of_life/widgets/BoardWidget.dart';
import 'package:flutter/material.dart';

class BoardPage extends StatelessWidget {
  final Board board;
  final VoidCallback onDrawCell;
  final List<List<bool>> whoIsAlive;
  final VoidCallback updateTable;
  final Function(int, int) drawCellCallback;

  const BoardPage({
    Key key,
    this.board,
    this.onDrawCell,
    this.whoIsAlive,
    this.updateTable,
    this.drawCellCallback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conway`s Game of Life Sim"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BoardWidget(
              board: board,
              whoIsAlive: whoIsAlive,
              updateTable: updateTable,
              drawCellcallback: drawCellCallback,
            )
          ],
        ),
      ),
    );
  }
}
