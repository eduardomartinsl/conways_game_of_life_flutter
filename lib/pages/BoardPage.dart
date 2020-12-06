import 'package:conways_game_of_life/widgets/Board.dart';
import 'package:flutter/material.dart';

class BoardPage extends StatelessWidget {

  final int rowCount;
  final int columnCount;

  BoardPage(int rowCount, int columnCount)
      : rowCount = rowCount,
        columnCount = columnCount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Conway`s Game of Life Sim")),
      body: Board(
        columns: columnCount,
        rows: rowCount,
      ),
    );
  }
}
