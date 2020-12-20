import 'dart:convert';
import 'dart:ffi';

import 'package:conways_game_of_life/appState/AppState.dart';
import 'package:conways_game_of_life/models/Board.dart';
import 'package:conways_game_of_life/widgets/BoardWidget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

final databaseReference = FirebaseDatabase.instance.reference();

class BoardPage extends StatelessWidget {

  final Board board;
  final VoidCallback onDrawCell;
  final VoidCallback updateTable;
  final Function(int, int) drawCellCallback;


  const BoardPage(
      {Key key,
      this.board,
      this.onDrawCell,
      this.updateTable,
      this.drawCellCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conway`s Game of Life Sim"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BoardWidget(
              board: board,
              updateTable: updateTable,
              drawCellcallback: drawCellCallback,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.play_arrow),
          onPressed: () => {
                databaseReference.child("isPaused").set({
                  'status': false,
                }),
              },
          label: Text("Execute")),
    );
  }
}
