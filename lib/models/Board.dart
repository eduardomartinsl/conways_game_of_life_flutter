import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Board {
  final int numberOfRows;
  final int numberOfColumns;
  final double boardWidth;
  final double boardHeight;
  final double cellWidth;
  final double cellHeight;
  List<List<bool>> whoIsAlive;

  Board({
    this.numberOfRows,
    this.numberOfColumns,
    this.boardWidth,
    this.boardHeight,
    this.cellWidth,
    this.cellHeight,
    this.whoIsAlive,
  });

  Map<String, dynamic> toJson() {
    return {
      "numberOfRows": this.numberOfRows,
      "numberOfColumns": this.numberOfColumns,
      "boardWidth": this.boardWidth,
      "boardHeight": this.boardHeight,
      "cellWidth": this.cellWidth,
      "cellHeight": this.cellHeight,
      "whoIsAlive": this.whoIsAlive,
    };
  }
}
