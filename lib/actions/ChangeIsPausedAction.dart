import 'package:async_redux/async_redux.dart';
import 'package:conways_game_of_life/appState/AppState.dart';
import 'package:conways_game_of_life/models/Board.dart';

class ChangeIsPausedAction extends ReduxAction<AppState> {
  @override
  AppState reduce() {
    if (!state.isPaused) {
      var indexColor = state.selectedColorIndex;
      indexColor += 1;
      if (indexColor >= state.predefinedColors.length) indexColor = 0;
      Board board =
          state.board.copy(cellColor: state.predefinedColors[indexColor]);
      return state.copy(
        isPaused: !state.isPaused,
        board: board,
        selectedColorIndex: indexColor,
      );
    }

    return state.copy(isPaused: !state.isPaused);
  }
}
