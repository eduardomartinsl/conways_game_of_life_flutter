import 'package:conways_game_of_life/models/Board.dart';
import 'package:flutter/foundation.dart';

@immutable
class AppState {
  final Board board;

  final bool isPaused;

  AppState({
    this.board,
    this.isPaused,
  });

  AppState copy({
    Board board,
    bool isPaused,
  }) =>
      AppState(
        board: board ?? this.board,
        isPaused: isPaused ?? isPaused,
      );

  static AppState initialState({
    board,
    isPaused,
  }) {
    return AppState(
      board: board,
      isPaused: isPaused,
    );
  }
}
