import 'package:flutter/foundation.dart';

@immutable
class AppState {
  final List<List<bool>> whoIsAlive;
  final List<List<bool>> newCycle;

  //todo substituir tudo por um board?
  final int numberOfRows;
  final int numberOfColumns;
  final double boardWidth;
  final double boardHeight;
  final double cellWidth;
  final double cellHeight;

  AppState({
    this.numberOfRows,
    this.numberOfColumns,
    this.boardWidth,
    this.boardHeight,
    this.cellWidth,
    this.cellHeight,
    this.whoIsAlive,
    this.newCycle
  });

  AppState copy({
    List<List<bool>> whoIsAlive,
    List<List<bool>> newCycle,
    int numberOfRows,
    int numberOfColumns,
    double boardWidth,
    double boardHeight,
    double cellWidth,
    double cellHeight,
  }) =>
      AppState(
          whoIsAlive: whoIsAlive ?? this.whoIsAlive,
          numberOfRows: numberOfRows ?? this.numberOfRows,
          numberOfColumns: numberOfColumns ?? this.numberOfColumns,
          boardWidth: boardWidth ?? this.boardWidth,
          boardHeight: boardHeight ?? this.boardHeight,
          cellWidth: cellWidth ?? this.cellWidth,
          cellHeight: cellHeight ?? this.cellHeight);

  static AppState initialState({
    numberOfRows,
    numberOfColumns,
    boardWidth,
    boardHeight,
    cellWidth,
    cellHeight,
    isAlive,
  })
      {
        return AppState(
          whoIsAlive: List.generate(numberOfRows, (i) {
            return List.generate(numberOfRows, (j) {
              return false;
            });
          }),

          numberOfRows: numberOfRows,
          numberOfColumns: numberOfColumns,
          boardWidth: boardWidth,
          boardHeight: boardHeight,
          cellWidth: cellWidth,
          cellHeight: cellHeight,
        );
      }

}
