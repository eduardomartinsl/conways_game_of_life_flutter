import 'package:async_redux/async_redux.dart';
import 'package:conways_game_of_life/actions/ChangeCellStateAction.dart';
import 'package:conways_game_of_life/appState/AppState.dart';
import 'package:conways_game_of_life/conectors/MainPageConnector.dart';
import 'package:conways_game_of_life/viewModels/BoardPageViewModel.dart';

class BoardFactory extends VmFactory<AppState, MainPageConnector> {
  BoardFactory(widget) : super(widget);

  @override
  Vm fromStore() => BoardPageViewModel(
        numberOfRows: state.numberOfRows,
        numberOfColumns: state.numberOfColumns,
        boardWidth: state.boardWidth,
        boardHeight: state.boardHeight,
        cellWidth: state.cellWidth,
        cellHeight: state.cellHeight,
        onDrawCell: () => dispatch(ChangeCellStateAction(whoIsAlive: state.whoIsAlive)),
        whoIsAlive: state.whoIsAlive,
      );
}