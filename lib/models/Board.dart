import 'package:conways_game_of_life/models/Cell.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

@immutable
@JsonSerializable()
class Board {
  final int numberOfRows;
  final int numberOfColumns;
  final double boardWidth;
  final double boardHeight;
  final double cellWidth;
  final double cellHeight;
  final List<List<Cell>> cells;
  final Color cellColor;

  Board({
    this.numberOfRows,
    this.numberOfColumns,
    this.boardWidth,
    this.boardHeight,
    this.cellWidth,
    this.cellHeight,
    this.cells,
    this.cellColor,
  });

  Map<String, dynamic> toJson() {
    return {
      "numberOfRows": this.numberOfRows,
      "numberOfColumns": this.numberOfColumns,
      "boardWidth": this.boardWidth,
      "boardHeight": this.boardHeight,
      "cellWidth": this.cellWidth,
      "cellHeight": this.cellHeight,
      "cells": this.cells,
      "cellColor": this.cellColor,
    };
  }

  Board copy({
    int numberOfRows,
    int numberOfColumns,
    double boardWidth,
    double boardHeight,
    double cellWidth,
    double cellHeight,
    List<List<Cell>> cells,
    Color cellColor,
  }) =>
      Board(
        numberOfRows: numberOfRows ?? this.numberOfRows,
        numberOfColumns: numberOfColumns ?? this.numberOfColumns,
        boardWidth: boardWidth ?? this.boardWidth,
        boardHeight: boardHeight ?? this.boardHeight,
        cellWidth: cellWidth ?? this.cellWidth,
        cellHeight: cellHeight ?? this.cellHeight,
        cells: cells ?? this.cells,
        cellColor: cellColor ?? this.cellColor,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Board &&
          runtimeType == other.runtimeType &&
          numberOfRows == other.numberOfRows &&
          numberOfColumns == other.numberOfColumns &&
          boardWidth == other.boardWidth &&
          boardHeight == other.boardHeight &&
          cellWidth == other.cellWidth &&
          cellHeight == other.cellHeight &&
          cells == other.cells &&
          // DeepCollectionEquality().equals(cells, other.cells) &&
          cellColor == other.cellColor;

  @override
  int get hashCode =>
      numberOfRows.hashCode ^
      numberOfColumns.hashCode ^
      boardWidth.hashCode ^
      boardHeight.hashCode ^
      cellWidth.hashCode ^
      cellHeight.hashCode ^
      cells.hashCode ^
      // DeepCollectionEquality().hash(cells) ^
      cellColor.hashCode;
}
