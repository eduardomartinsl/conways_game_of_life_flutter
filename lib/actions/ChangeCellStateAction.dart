import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:conways_game_of_life/appState/AppState.dart';
import 'package:conways_game_of_life/pages/BoardPage.dart';

class ChangeCellStateAction extends ReduxAction<AppState> {
  final int row;
  final int column;

  ChangeCellStateAction({this.row, this.column})
      : assert(row != null),
        assert(column != null);

  @override
  Future<AppState> reduce() async {
    var newBoard = state.board;
    try {
      newBoard.whoIsAlive[row][column] = !state.board.whoIsAlive[row][column];
    } catch (error) {
      print('Caught error: $error');
    }

    await databaseReference.child("board").set({
      'boardState': jsonEncode(newBoard)
    });
    // return state.copy(board: newBoard);
  }
}
