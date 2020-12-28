import 'package:async_redux/async_redux.dart';
import 'package:conways_game_of_life/appState/AppState.dart';
import 'package:conways_game_of_life/models/Board.dart';

class ChangeIsPausedAction extends ReduxAction<AppState> {
  @override
  AppState reduce() {
    if (!state.isPaused) {
      var colorIndex = state.selectedColorIndex;
      colorIndex += 1;
      if (colorIndex >= state.predefinedColors.length) colorIndex = 0;
      Board board =
          state.board.copy(cellColor: state.predefinedColors[colorIndex]);
      return state.copy(
        isPaused: !state.isPaused,
        board: board,
        selectedColorIndex: colorIndex,
      );
    }

    return state.copy(isPaused: !state.isPaused);
  }
}
