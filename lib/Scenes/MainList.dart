import 'package:flutter/material.dart';
import 'StarshipsList.dart';
import '../Extensions/Color+HexColor.dart';
import '../Services/Endpoints.dart';

class MainList extends StatefulWidget {
  MainList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainListState createState() => _MainListState();
}

  class _MainListState extends State<MainList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,
          style: TextStyle(color: HexColor("#FFE81F")),
        ),
         backgroundColor: HexColor("#000000"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          Endpoint item = Endpoint.values[index];
          return GestureDetector(
            child: Container(
              height: 50,
              color: HexColor("#000000"),
              child: Center(child: Text(item.toShortString(),
                                        style: TextStyle(color: HexColor("#FFE81F")))),
            ),
            onTap: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => item.route()),
                    );
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider()
      ),
    );
  }
}
