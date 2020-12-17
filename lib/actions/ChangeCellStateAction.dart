import 'package:async_redux/async_redux.dart';
import 'package:conways_game_of_life/appState/AppState.dart';

class ChangeCellStateAction extends ReduxAction<AppState> {
  List<List<bool>> whoIsAlive;

  ChangeCellStateAction({this.whoIsAlive}) : assert(whoIsAlive != null);

  @override
  AppState reduce(){
    return state.copy(whoIsAlive: state.whoIsAlive);
  }
}
