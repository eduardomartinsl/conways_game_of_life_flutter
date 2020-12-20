import 'package:conways_game_of_life/models/Board.dart';
import 'package:flutter/foundation.dart';

@immutable
class AppState {
  final Board board;

  AppState({
    this.board,
  });

  AppState copy({
    Board board,
  }) =>
      AppState(
        board: board ?? this.board,
      );

  static AppState initialState({
    board,
  }) {
    return AppState(
      board: board,
    );
  }
}
