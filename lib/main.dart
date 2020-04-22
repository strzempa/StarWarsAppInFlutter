import 'package:flutter/material.dart';
import 'MainView.dart';
import 'Extensions/Color+HexColor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Star Wars Flutter App'),
      theme: ThemeData(
        primaryColor: HexColor("#000000"),
      ),
    );
  }
}
