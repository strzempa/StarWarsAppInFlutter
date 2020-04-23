import 'package:flutter/material.dart';
import '../Extensions/Color+HexColor.dart';
import '../Services/StarWarsFutures.dart';
import '../Models/Films.dart';

class FilmsList extends StatefulWidget {
  FilmsList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _FilmsState createState() => _FilmsState();
}

class _FilmsState extends State<FilmsList> {
  Future<Films> fetch;

  @override
  void initState() {
    super.initState();
    fetch = fetchFilms();
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
          child: FutureBuilder<Films>(
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
                        color: HexColor("#FFC704"),
                        child: Center(child: Text('${item.title}',
                                                  style: TextStyle(color: HexColor("#D92231")))),
                      ),
                      onTap: () => Scaffold
                          .of(context)
                          .showSnackBar(SnackBar(content:
                            Text(" title: " + item.title
                            + "\n openingCrawl: "
                            + item.openingCrawl
                            + "\n director: "
                            + item.director
                            + "\n producer: "
                            + item.producer))),
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
