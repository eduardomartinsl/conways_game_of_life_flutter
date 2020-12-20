import 'package:async_redux/async_redux.dart';
import 'package:conways_game_of_life/appState/AppState.dart';
class ChangeCellStateAction extends ReduxAction<AppState> {
  final int row;
  final int column;

  ChangeCellStateAction({this.row, this.column})
      : assert(row != null),
        assert(column != null);

  @override
  Future<AppState> reduce() async {
    //
    List<List<bool>> newWhoIsAlive = [];

    for (List<bool> row in state.board.whoIsAlive) {
      //
      var newRow = <bool>[];

      for (bool element in row) {
        newRow.add(element);
      }

      newWhoIsAlive.add(newRow);
    }

    var newBoard = state.board.copy(whoIsAlive: newWhoIsAlive);

    // TODO: Ao final da implementação remover este try/catch assim que possivel.
    // TODO: Programas não podem engolir erros a menos que seja necessário.
    try {
      newBoard.whoIsAlive[row][column] = !state.board.whoIsAlive[row][column];
    } catch (error) {
      print('Caught error: $error');
    }

    // await databaseReference.child("board").set({
    //   'boardState': jsonEncode(newBoard)
    // });

    assert(state.board != newBoard );
    return state.copy(board: newBoard);
  }
}
