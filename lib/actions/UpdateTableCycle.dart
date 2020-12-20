import 'package:async_redux/async_redux.dart';
import 'package:conways_game_of_life/appState/AppState.dart';

class UpdateTableCycle extends ReduxAction<AppState> {
  final List<List<bool>> newCycle;
  final bool isPaused;

  UpdateTableCycle({this.isPaused, this.newCycle})
      : assert(newCycle != null),
        assert(isPaused != null);

  @override
  AppState reduce() {
    if (!isPaused) {
      return state.copy(board: state.board);
    }
  }
}
