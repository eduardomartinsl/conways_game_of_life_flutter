import 'package:async_redux/async_redux.dart';

class BoardPageViewModel extends Vm {
  final int numberOfRows;
  final int numberOfColumns;
  final double boardWidth;
  final double boardHeight;
  final double cellWidth;
  final double cellHeight;

  BoardPageViewModel({
    this.numberOfRows,
    this.numberOfColumns,
    this.boardWidth,
    this.boardHeight,
    this.cellWidth,
    this.cellHeight,
  }) : super(equals: [
          numberOfRows,
          numberOfColumns,
          boardWidth,
          boardHeight,
          cellWidth,
          cellHeight
        ]);
}
