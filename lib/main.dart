import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

import 'models/Board.dart';

Store<Board> boardStore;

int numberOfRows = 30;
int numberOfColumns = 20;
double boardWidth = 500;
double boardHeight = 500;
List<List<bool>> isAlive;

void main() {
  isAlive = new List<List<bool>>(numberOfRows);
  boardStore = Store<Board>(
      initialState: Board(
    width: boardWidth,
    height: boardHeight,
    numberOfColumns: numberOfColumns,
    numberOfRows: numberOfRows,
  ));
  runApp(NewMainPage());
}

class NewMainPage extends StatefulWidget {
  @override
  _NewMainPageState createState() => _NewMainPageState();
}

class _NewMainPageState extends State<NewMainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Conway`s Game of Life Sim"),
          ),
          body: Container(
            constraints: BoxConstraints.expand(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Listener(
                    onPointerDown: (PointerEvent e) => {

                    },
                    //todo: dispose no listener ao sair da tela
                    child: SizedBox(
                      width: boardWidth,
                      height: boardHeight,
                      child: CustomPaint(
                        painter: Board(
                          numberOfRows: numberOfRows,
                          numberOfColumns: numberOfColumns,
                          width: boardWidth,
                          height: boardHeight,
                        ),
                      ),
                    ),
                  ),
                  // ),
                )
              ],
            ),
          ),
        ));
  }
}
