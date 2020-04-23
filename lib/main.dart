import 'package:flutter/material.dart';
import 'Scenes/MainList.dart';
import 'Extensions/Color+HexColor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    runApp(
      MaterialApp(
        title: 'Flutter Demo',
        home: MainList(title: 'Star Wars Flutter App'),
        theme: ThemeData(
          primaryColor: HexColor("#000000"),
        ),
      )
    );
  }
}
