import 'package:conways_game_of_life/widgets/Board.dart';
import 'package:flutter/material.dart';

class BoardPage extends StatelessWidget {
  final int numberOfRows;
  final int numberOfColumns;
  final double boardWidth;
  final double boardHeight;
  final double cellWidth;
  final double cellHeight;

  const BoardPage(
      {Key key,
      this.numberOfRows,
      this.numberOfColumns,
      this.boardWidth,
      this.boardHeight,
      this.cellWidth,
      this.cellHeight})
      : super(key: key);

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
            Board(
              numberOfRows: numberOfRows,
              numberOfColumns: numberOfColumns,
              boardWidth: boardWidth,
              boardHeight: boardHeight,
              cellWidth: cellWidth,
              cellHeight: cellHeight,
            )
          ],
        ),
      ),
    );
  }
}
