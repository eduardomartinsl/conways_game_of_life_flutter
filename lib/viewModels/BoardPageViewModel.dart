import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

class BoardPageViewModel extends Vm {
  final int numberOfRows;
  final int numberOfColumns;
  final double boardWidth;
  final double boardHeight;
  final double cellWidth;
  final double cellHeight;
  final VoidCallback onChangeCellState;

  BoardPageViewModel({
    this.onChangeCellState,
    this.numberOfRows,
    this.numberOfColumns,
    this.boardWidth,
    this.boardHeight,
    this.cellWidth,
    this.cellHeight,
  }) : super(equals: [
          onChangeCellState,
          numberOfRows,
          numberOfColumns,
          boardWidth,
          boardHeight,
          cellWidth,
          cellHeight
        ]);
}
