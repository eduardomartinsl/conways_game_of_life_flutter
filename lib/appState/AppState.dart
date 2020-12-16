class AppState {
  final List<List<bool>> isAlive;
  final int numberOfRows;
  final int numberOfColumns;
  final double boardWidth;
  final double boardHeight;
  final double cellWidth;
  final double cellHeight;

  AppState({
    this.numberOfRows,
    this.numberOfColumns,
    this.boardWidth,
    this.boardHeight,
    this.cellWidth,
    this.cellHeight,
    this.isAlive,
  });

  AppState copy({
    List<List<bool>> isAlive,
    int numberOfRows,
    int numberOfColumns,
    double boardWidth,
    double boardHeight,
    double cellWidth,
    double cellHeight,
  }) =>
      AppState(
          isAlive: isAlive ?? this.isAlive,
          numberOfRows: numberOfRows ?? this.numberOfRows,
          numberOfColumns: numberOfColumns ?? this.numberOfColumns,
          boardWidth: boardWidth ?? this.boardWidth,
          boardHeight: boardHeight ?? this.boardHeight,
          cellWidth: cellWidth ?? this.cellWidth,
          cellHeight: cellHeight ?? this.cellHeight);

  static AppState initialState({
    numberOfRows,
    numberOfColumns,
    boardWidth,
    boardHeight,
    cellWidth,
    cellHeight,
    isAlive,
  })
      {
        return AppState(
          isAlive: List.generate(numberOfRows, (i) {
            return List.generate(numberOfRows, (j) {
              return false;
            });
          }),

          numberOfRows: numberOfRows,
          numberOfColumns: numberOfColumns,
          boardWidth: boardWidth,
          boardHeight: boardHeight,
          cellWidth: cellWidth,
          cellHeight: cellHeight,
        );
      }

}
