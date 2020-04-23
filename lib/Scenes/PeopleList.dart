import 'package:flutter/material.dart';
import '../Extensions/Color+HexColor.dart';
import '../Services/StarWarsFutures.dart';
import '../Models/People.dart';

class PeopleList extends StatefulWidget {
  PeopleList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PeopleState createState() => _PeopleState();
}

class _PeopleState extends State<PeopleList> {
  Future<People> fetch;

  @override
  void initState() {
    super.initState();
    fetch = fetchPeople();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title,
            style: TextStyle(color: HexColor("#FFE81F")),
          ),
           backgroundColor: HexColor("#000000"),
           leading: new IconButton(
          icon: new Icon(Icons.keyboard_arrow_left),
          onPressed: () => Navigator.of(context).pop(),
        ),
        ),
        body: Center(
          child: FutureBuilder<People>(
            future: fetch,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: snapshot.data.results.length,
                  itemBuilder: (BuildContext context, int index) {
                    Result item = snapshot.data.results[index];
                    return GestureDetector(
                      child: Container(
                        height: 50,
                        color: HexColor("#EABF99"),
                        child: Center(child: Text('${item.name}',
                                                  style: TextStyle(color: HexColor("#4F2185")))),
                      ),
                      onTap: () => Scaffold
                          .of(context)
                          .showSnackBar(SnackBar(content:
                            Text(" name: " + item.name
                            + "\n height: "
                            + item.height
                            + "\n mass: "
                            + item.mass
                            + "\n hairColor: "
                            + item.hairColor
                            + "\n skinColor: "
                            + item.skinColor
                            + "\n eyeColor: "
                            + item.eyeColor
                            + "\n birthYear: "
                            + item.birthYear
                            + "\n gender: "
                            + item.gender.toString()))),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => const Divider()
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
