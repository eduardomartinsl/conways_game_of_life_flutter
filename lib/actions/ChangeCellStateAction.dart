import 'package:async_redux/async_redux.dart';
import 'package:conways_game_of_life/appState/AppState.dart';

class ChangeCellStateAction extends ReduxAction<AppState> {
  //todo list

  final int row;
  final int column;

  ChangeCellStateAction({this.row, this.column})
      : assert(row != null),
        assert(column != null);

  @override
  AppState reduce() {
    var newState = state.whoIsAlive;
    newState[row][column] = !state.whoIsAlive[row][column];

    return state.copy(whoIsAlive: newState);
  }
}
