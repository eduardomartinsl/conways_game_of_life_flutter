import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:conways_game_of_life/appState/AppState.dart';
import 'package:conways_game_of_life/models/Board.dart';
import 'package:firebase_database/firebase_database.dart';

class UpdateTableCycleAction extends ReduxAction<AppState> {
  Board actualBoard;
  Board newBoard;

  final databaseReference = FirebaseDatabase.instance.reference();

  AppState reduce() {
    if(state.isPaused) return null;

    List<List<bool>> actualTable = [];

    for (List<bool> row in state.board.whoIsAlive) {
      var newRow = <bool>[];
      for (bool element in row) {
        newRow.add(element);
      }

      actualTable.add(newRow);
    }

    actualBoard = state.board.copy(whoIsAlive: actualTable);
    newBoard = state.board.copy(whoIsAlive: actualTable);

    for (var row = 0; row < actualBoard.numberOfRows; row++) {
      for (var column = 0; column < actualBoard.numberOfColumns; column++) {

        int totalNeighbours = countNeighbours(row, column);

        newBoard.whoIsAlive[row][column] =
            !actualBoard.whoIsAlive[row][column] && totalNeighbours == 3 ||
                actualBoard.whoIsAlive[row][column] &&
                    totalNeighbours >= 2 &&
                    totalNeighbours <= 3;
      }
    }

    assert(state.board != newBoard );

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
        var localRow = (i + state.board.numberOfRows) % state.board.numberOfRows;
        var localColumn = (j + state.board.numberOfColumns) % state.board.numberOfColumns;
        if (state.board.whoIsAlive[localRow][localColumn])
          neighboursCount++;
      }
    neighboursCount -= (actualBoard.whoIsAlive[row][column] ? 1 : 0);
    return neighboursCount;
  }
}
