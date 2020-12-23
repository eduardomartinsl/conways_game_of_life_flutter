import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:conways_game_of_life/actions/ChangeCellStateAction.dart';
import 'package:conways_game_of_life/actions/ChangeIsPausedAction.dart';
import 'package:conways_game_of_life/actions/UpdateTableCycleAction.dart';
import 'package:conways_game_of_life/appState/AppState.dart';
import 'package:conways_game_of_life/models/Board.dart';
import 'package:conways_game_of_life/pages/BoardPage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BoardPageConnector extends StatelessWidget {
  BoardPageConnector({Key key}) : super(key: key);

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
              isPaused: vm.isPaused,
              changeIsPaused: vm.changeIsPaused,
            ));
  }
}

class BoardFactory extends VmFactory<AppState, BoardPageConnector> {
  BoardFactory(widget) : super(widget);

  @override
  Vm fromStore() => BoardPageViewModel(
        board: state.board,
        drawCellCallback: (row, column) =>
            dispatch(ChangeCellStateAction(row: row, column: column)),
        updateCycle: () => dispatch(UpdateTableCycleAction()),
        changeIsPaused: () => dispatch(ChangeIsPausedAction()),
        isPaused: state.isPaused,
      );
}

class BoardPageViewModel extends Vm {
  final Function(int, int) drawCellCallback;
  final Board board;
  final VoidCallback updateCycle;

  final bool isPaused;

  final VoidCallback changeIsPaused;

  BoardPageViewModel({
    @required this.drawCellCallback,
    @required this.updateCycle,
    @required this.board,
    @required this.isPaused,
    @required this.changeIsPaused,
  }) : super(equals: [
          board,
          isPaused,
        ]);
}
