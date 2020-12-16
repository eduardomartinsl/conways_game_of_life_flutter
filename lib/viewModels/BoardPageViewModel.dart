import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

class BoardPageViewModel extends Vm {
  final int numberOfRows;
  final int numberOfColumns;
  final double boardWidth;
  final double boardHeight;
  final double cellWidth;
  final double cellHeight;

  BoardPageViewModel({
    @required this.numberOfRows,
    @required this.numberOfColumns,
    @required this.boardWidth,
    @required this.boardHeight,
    @required this.cellWidth,
    @required this.cellHeight,
  }) : super(equals: [
          numberOfRows,
          numberOfColumns,
          boardWidth,
          boardHeight,
          cellWidth,
          cellHeight
        ]);
}
