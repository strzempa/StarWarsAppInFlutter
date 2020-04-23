import 'package:flutter/material.dart';
import '../Extensions/Color+HexColor.dart';
import '../Services/StarWarsFutures.dart';
import '../Models/Planets.dart';

class PlanetsList extends StatefulWidget {
  PlanetsList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PlanetsState createState() => _PlanetsState();
}

class _PlanetsState extends State<PlanetsList> {
  Future<Planets> fetch;

  @override
  void initState() {
    super.initState();
    fetch = fetchPlanets();
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
          child: FutureBuilder<Planets>(
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
                        color: HexColor("#000000"),
                        child: Center(child: Text('${item.name}',
                                                  style: TextStyle(color: HexColor("#FFD602")))),
                      ),
                      onTap: () => Scaffold
                          .of(context)
                          .showSnackBar(SnackBar(content:
                            Text(" name: " + item.name
                            + "\n rotationPeriod: "
                            + item.rotationPeriod
                            + "\n orbitalPeriod: "
                            + item.orbitalPeriod
                            + "\n diameter: "
                            + item.diameter
                            + "\n climate: "
                            + item.climate
                            + "\n gravity: "
                            + item.gravity
                            + "\n terrain: "
                            + item.terrain
                            + "\n surfaceWater: "
                            + item.surfaceWater
                            + "\n population: "
                            + item.population))),
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
