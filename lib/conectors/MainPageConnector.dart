import 'package:async_redux/async_redux.dart';
import 'package:conways_game_of_life/actions/ChangeCellStateAction.dart';
import 'package:conways_game_of_life/actions/UpdateTableCycleAction.dart';
import 'package:conways_game_of_life/appState/AppState.dart';
import 'package:conways_game_of_life/models/Board.dart';
import 'package:conways_game_of_life/pages/BoardPage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainPageConnector extends StatelessWidget {
  MainPageConnector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, BoardPageViewModel>(
        vm: BoardFactory(this),
        builder: (
          BuildContext context,
          BoardPageViewModel vm,
        ) =>
            BoardPage(
              board: vm.board,
              drawCellCallback: vm.drawCellCallback,
              updateCycle: vm.updateCycle,
            ));
  }
}

class BoardFactory extends VmFactory<AppState, MainPageConnector> {
  BoardFactory(widget) : super(widget);

  @override
  Vm fromStore() => BoardPageViewModel(
        board: state.board,
        drawCellCallback: (row, column) => dispatch(
          ChangeCellStateAction(
            row: row,
            column: column,
          ),
        ),
        updateCycle: () => dispatch(UpdateTableCycleAction()),
      );
}

class BoardPageViewModel extends Vm {
  final Function(int, int) drawCellCallback;
  final Board board;
  final VoidCallback updateCycle;

  BoardPageViewModel({
    @required this.drawCellCallback,
    @required this.updateCycle,
    @required this.board,
  }) : super(equals: [
          board,
        ]);
}
