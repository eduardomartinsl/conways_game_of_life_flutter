import 'package:conways_game_of_life/models/Board.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class AppState {
  final Board board;

  final bool isPaused;

  final List<Color> predefinedColors;
  final int selectedColorIndex;

  AppState({
    this.board,
    this.isPaused,
    this.predefinedColors,
    this.selectedColorIndex,
  });

  AppState copy({
    Board board,
    bool isPaused,
    int selectedColorIndex,
    List<Color> predefinedColors,
  }) =>
      AppState(
        board: board ?? this.board,
        isPaused: isPaused ?? this.isPaused,
        selectedColorIndex: selectedColorIndex ?? this.selectedColorIndex,
        predefinedColors: predefinedColors ?? this.predefinedColors,
      );

  static AppState initialState({
    board,
    isPaused,
    predefinedColors,
    selectedColorIndex,
  }) {
    return AppState(
      board: board,
      isPaused: isPaused,
      predefinedColors: predefinedColors,
      selectedColorIndex: selectedColorIndex,
    );
  }
}
