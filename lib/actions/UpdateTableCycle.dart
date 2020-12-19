import 'package:async_redux/async_redux.dart';
import 'package:conways_game_of_life/appState/AppState.dart';

class UpdateTableCycle extends ReduxAction<AppState>{

  final List<List<bool>> newCycle;

  UpdateTableCycle({this.newCycle}) : assert(newCycle != null);

  @override
  AppState reduce() {
    return state.copy(whoIsAlive: newCycle);
  }

}