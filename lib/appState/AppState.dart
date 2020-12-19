import 'package:conways_game_of_life/models/Board.dart';
import 'package:flutter/foundation.dart';

@immutable
class AppState {
  final List<List<bool>> whoIsAlive;
  final List<List<bool>> newCycle;

  final Board board;

  AppState({
    this.board,
    this.whoIsAlive,
    this.newCycle,
  });

  AppState copy({
    List<List<bool>> whoIsAlive,
    List<List<bool>> newCycle,
    Board board,
  }) =>
      AppState(
        whoIsAlive: whoIsAlive ?? this.whoIsAlive,
        board: board ?? this.board,
      );

  static AppState initialState({
    board,
    isAlive,
  }) {
    return AppState(
      whoIsAlive: List.generate(board.numberOfRows, (i) {
        return List.generate(board.numberOfRows, (j) {
          return false;
        });
      }),
      board: board,
    );
  }
}
