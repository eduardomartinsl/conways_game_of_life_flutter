import 'package:async_redux/async_redux.dart';
import 'package:conways_game_of_life/appState/AppState.dart';
import 'package:conways_game_of_life/models/Board.dart';
import 'package:conways_game_of_life/models/Cell.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateTableCycleAction extends ReduxAction<AppState> {
  Board actualBoard;
  Board newBoard;

  final databaseReference = FirebaseDatabase.instance.reference();

  AppState reduce() {
    if (state.isPaused) return null;

    List<List<Cell>> actualTable = [];

    for (List<Cell> row in state.board.cells) {
      var newRow = <Cell>[];
      for (Cell element in row) {
        newRow.add(element);
      }

      actualTable.add(newRow);
    }

    actualBoard = state.board.copy(cells: actualTable);
    newBoard = state.board.copy(cells: actualTable);

    for (var row = 0; row < actualBoard.numberOfRows; row++) {
      for (var column = 0; column < actualBoard.numberOfColumns; column++) {
        int totalNeighbours = countNeighbours(row, column);

        newBoard.cells[row][column] = Cell(
          color: Colors.black,
          isAlive:
              !actualBoard.cells[row][column].isAlive && totalNeighbours == 3 ||
                  actualBoard.cells[row][column].isAlive &&
                      totalNeighbours >= 2 &&
                      totalNeighbours <= 3,
        );
      }
    }

    assert(state.board != newBoard);

    //todo área de sync com real time database
    // await databaseReference.child("board").set({
    //   'boardState': jsonEncode(newBoard)
    // });

    return state.copy(board: newBoard);
  }

  int countNeighbours(int row, int column) {
    int neighboursCount = 0;
    for (var i = row - 1; i <= row + 1; i++)
      for (var j = column - 1; j <= column + 1; j++) {
        var localRow =
            (i + state.board.numberOfRows) % state.board.numberOfRows;
        var localColumn =
            (j + state.board.numberOfColumns) % state.board.numberOfColumns;
        if (state.board.cells[localRow][localColumn].isAlive) neighboursCount++;
      }
    neighboursCount -= (actualBoard.cells[row][column].isAlive ? 1 : 0);
    return neighboursCount;
  }
}
