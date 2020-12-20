import 'package:flutter/material.dart';

class BoardCustomPainter extends CustomPainter {
  double cellWidth;
  double cellHeight;
  final int numberOfRows;
  final int numberOfColumns;
  List<List<bool>> isAliveMatrix;

  BoardCustomPainter({
    this.numberOfRows,
    this.numberOfColumns,
    this.cellWidth,
    this.cellHeight,
    this.isAliveMatrix,
  });

  // void update() {
  //   List<List<bool>> nextState = isAliveMatrix;
  //
  //   for (var row = 0; row < numberOfRows; row++)
  //     for (var column = 0; column < numberOfColumns; column++) {
  //       int totalNeighbours = countNeighbours(row, column);
  //       nextState[row][column] =
  //           !isAliveMatrix[row][column] && totalNeighbours == 3 ||
  //               isAliveMatrix[row][column] &&
  //                   totalNeighbours >= 2 &&
  //                   totalNeighbours <= 3;
  //     }
  // }
  //
  // int countNeighbours(int row, int column) {
  //   int count = 0;
  //   for (var i = row - 1; i <= row + 1; i++)
  //     for (var j = column - 1; j <= column + 1; j++) {
  //       if (isAliveMatrix[(i + numberOfRows) % numberOfRows]
  //           [(j + numberOfColumns) % numberOfColumns]) count++;
  //     }
  //   count -= (isAliveMatrix[row][column] ? 1 : 0);
  //   return count;
  // }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Offset(0, 0) &
          Size(
            cellWidth * numberOfRows,
            cellHeight * numberOfColumns,
          ),
      Paint()..color = Colors.white,
    );

    for (var row = 0; row < numberOfRows; row++) {
      for (var column = 0; column < numberOfColumns; column++) {
        if (isAliveMatrix[row][column]) {
          renderCell(
            canvas,
            row * cellHeight,
            column * cellWidth,
            cellWidth,
            cellHeight,
          );
        }
      }
    }
  }

  void renderCell(
    Canvas canvas,
    double dx,
    double dy,
    double cellWidth,
    double cellHeight,
  ) {
    canvas.drawRect(
      Offset(dx, dy) & Size(cellWidth, cellHeight),
      Paint()..color = Colors.black45,
    );
  }

  @override
  bool shouldRepaint(BoardCustomPainter oldDelegate) {
    return true;
  }
}
