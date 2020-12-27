import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:conways_game_of_life/appState/AppState.dart';
import 'package:conways_game_of_life/models/Cell.dart';
import 'package:flutter/material.dart';

class ChangeCellStateAction extends ReduxAction<AppState> {
  final int row;
  final int column;

  ChangeCellStateAction({this.row, this.column})
      : assert(row != null),
        assert(column != null);

  @override
  AppState reduce() {
    List<List<Cell>> newCellsMatrix = [];

    for (List<Cell> row in state.board.cells) {
      var newRow = List<Cell>();

      for (Cell element in row) {
        newRow.add(element);
      }

      newCellsMatrix.add(newRow);
    }

    var newBoard = state.board.copy(cells: newCellsMatrix);
    newBoard.cells[row][column] = Cell(
      color: state.board.cellColor,
      isAlive: !state.board.cells[row][column].isAlive,
    );

    assert(state.board != newBoard);

    return state.copy(board: newBoard);
  }
}
