import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

class BoardPageViewModel extends Vm {
  final VoidCallback onDrawCell;
  final VoidCallback updateTable;
  Function(int, int) drawCellCallback;

  final int numberOfRows;
  final int numberOfColumns;
  final double boardWidth;
  final double boardHeight;
  final double cellWidth;
  final double cellHeight;
  final List<List<bool>> whoIsAlive;


  BoardPageViewModel({
    @required this.updateTable,
    @required this.onDrawCell,
    @required this.drawCellCallback,
    @required this.numberOfRows,
    @required this.numberOfColumns,
    @required this.boardWidth,
    @required this.boardHeight,
    @required this.cellWidth,
    @required this.cellHeight,
    @required this.whoIsAlive,
  }) : super(equals: [
          numberOfRows,
          numberOfColumns,
          boardWidth,
          boardHeight,
          cellWidth,
          cellHeight,
          whoIsAlive
        ]);
}
