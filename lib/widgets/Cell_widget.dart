import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Cell_widget extends StatefulWidget {
  final int columnPosition;
  final int rowPosition;

  const Cell_widget({Key key, this.rowPosition, this.columnPosition}) : super(key: key);

  @override
  _Cell_widgetState createState() => _Cell_widgetState();
}

class _Cell_widgetState extends State<Cell_widget> {
  @override
  Widget build(BuildContext context) {

    int _rowPosition = widget.rowPosition;
    int _columnPosition = widget.columnPosition;

    return GestureDetector(
      onTap: (){
        Fluttertoast.showToast(
            msg: "rowPosition: $_rowPosition, columnPosition: $_columnPosition}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color:  Colors.white70 ,
            border: Border.all(color: Colors.black12)),
      ),
    );
  }
}
