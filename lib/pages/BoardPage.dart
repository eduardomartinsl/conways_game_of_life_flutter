import 'package:conways_game_of_life/widgets/BoardWidget.dart';
import 'package:flutter/material.dart';

class BoardPage extends StatelessWidget {
  final int numberOfRows;
  final int numberOfColumns;
  final double boardWidth;
  final double boardHeight;
  final double cellWidth;
  final double cellHeight;
  final VoidCallback onDrawCell;
  final List<List<bool>> whoIsAlive;
  final VoidCallback updateTable;
  final Function(int, int) drawCellCallback;

  const BoardPage({
    Key key,
    this.numberOfRows,
    this.numberOfColumns,
    this.boardWidth,
    this.boardHeight,
    this.cellWidth,
    this.cellHeight,
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
              numberOfRows: numberOfRows,
              numberOfColumns: numberOfColumns,
              boardWidth: boardWidth,
              boardHeight: boardHeight,
              cellWidth: cellWidth,
              cellHeight: cellHeight,
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
