import 'package:flutter/material.dart';
import '../Extensions/Color+HexColor.dart';
import '../Services/StarWarsFutures.dart';
import '../Models/Species.dart';

class SpeciesList extends StatefulWidget {
  SpeciesList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SpeciesState createState() => _SpeciesState();
}

class _SpeciesState extends State<SpeciesList> {
  Future<Species> fetch;

  @override
  void initState() {
    super.initState();
    fetch = fetchSpecies();
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
          child: FutureBuilder<Species>(
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
                        color: HexColor("#275031"),
                        child: Center(child: Text('${item.name}',
                                                  style: TextStyle(color: HexColor("#FFFFFF")))),
                      ),
                      onTap: () => Scaffold
                          .of(context)
                          .showSnackBar(SnackBar(content:
                            Text(" name: " + item.name
                            + "\n classification: "
                            + item.classification
                            + "\n designation: "
                            + item.designation.toString()
                            + "\n averageHeight: "
                            + item.averageHeight
                            + "\n skinColors: "
                            + item.skinColors
                            + "\n hairColors: "
                            + item.hairColors
                            + "\n eyeColors: "
                            + item.eyeColors
                            + "\n averageLifespan: "
                            + item.averageLifespan
                            + "\n language: "
                            + item.language))),
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
