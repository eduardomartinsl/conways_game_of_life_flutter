import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:conways_game_of_life/appState/AppState.dart';
import 'package:conways_game_of_life/models/Board.dart';
import 'package:firebase_database/firebase_database.dart';

class UpdateTableCycleAction extends ReduxAction<AppState> {
  @override
  Board newBoard;

  final databaseReference = FirebaseDatabase.instance.reference();

  List<List<bool>> hiddenMatrix1;
  List<List<bool>> hiddenMatrix2;

  AppState reduce() {
    if(state.isPaused) return null;
    List<List<bool>> newTableCycle = [];

    for (List<bool> row in state.board.whoIsAlive) {
      var newRow = <bool>[];
      for (bool element in row) {
        newRow.add(element);
      }

      newTableCycle.add(newRow);
    }

    newBoard = state.board.copy(whoIsAlive: newTableCycle);

    for (var row = 0; row < state.board.numberOfRows; row++) {
      for (var column = 0; column < state.board.numberOfColumns; column++) {
        int totalNeighbours = countNeighbours(row, column);
        newBoard.whoIsAlive[row][column] =
            !state.board.whoIsAlive[row][column] && totalNeighbours == 3 ||
                state.board.whoIsAlive[row][column] &&
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
        if (newBoard.whoIsAlive[
                (i + state.board.numberOfRows) % state.board.numberOfRows]
            [(j + state.board.numberOfColumns) % state.board.numberOfColumns])
          neighboursCount++;
      }
    neighboursCount -= (newBoard.whoIsAlive[row][column] ? 1 : 0);
    return neighboursCount;
  }
}
