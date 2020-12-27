import 'package:flutter/material.dart';

@immutable
class Cell {
  final Color color;
  final bool isAlive;

  Cell({this.color, this.isAlive});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Cell &&
          runtimeType == other.runtimeType &&
          color == other.color &&
          isAlive == other.isAlive;

  @override
  int get hashCode => color.hashCode ^ isAlive.hashCode;
}
