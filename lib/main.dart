import 'package:conways_game_of_life/pages/board_page.dart';
import 'package:flutter/material.dart';
import './models/Cell.dart';

void main() => runApp(MainPage());

int rowCount = 30;
int columnCount = 20;

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conway`s Game of Life Sim',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
    ),
    home: BoardPage(rowCount, columnCount),
    );
  }
}
