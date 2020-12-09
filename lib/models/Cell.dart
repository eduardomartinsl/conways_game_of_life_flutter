import 'dart:ui';

class Cell {
  final Color color;

  Cell({this.color});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Cell && runtimeType == other.runtimeType && color == other.color;

  @override
  int get hashCode => color.hashCode;
}
