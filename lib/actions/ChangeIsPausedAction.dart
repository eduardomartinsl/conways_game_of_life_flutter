import 'package:async_redux/async_redux.dart';
import 'package:conways_game_of_life/appState/AppState.dart';

class ChangeIsPausedAction extends ReduxAction<AppState> {
  @override
  AppState reduce() {
    return state.copy(isPaused: !state.isPaused);
  }
}
