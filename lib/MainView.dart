import 'package:flutter/material.dart';
import 'Extensions/Color+HexColor.dart';
import 'StarWarsFutures.dart';
import 'Models/Starships.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _StarshipsState createState() => _StarshipsState();
}

class _StarshipsState extends State<MyHomePage> {
  Future<Starships> fetchStarships;

  @override
  void initState() {
    super.initState();
    fetchStarships = fetch();
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
        ),
        body: Center(
          child: FutureBuilder<Starships>(
            future: fetchStarships,
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
                        child: Center(child: Text('Entry ${item.name}',
                                                  style: TextStyle(color: HexColor("#FFE81F")))),
                      ),
                      onTap: () => Scaffold
                          .of(context)
                          .showSnackBar(SnackBar(content:
                            Text(" name: " + item.name
                            + "\n model: "
                            + item.model
                            + "\n manufacturer: "
                            + item.manufacturer
                            + "\n costInCredits: "
                            + item.costInCredits
                            + "\n length: "
                            + item.length
                            + "\n maxAtmospheringSpeed: "
                            + item.maxAtmospheringSpeed
                            + "\n crew: "
                            + item.crew
                            + "\n passengers: "
                            + item.passengers
                            + "\n cargoCapacity: "
                            + item.cargoCapacity
                            + "\n consumables: "
                            + item.consumables
                            + "\n hyperdriveRating: "
                            + item.hyperdriveRating
                            + "\n mglt: "
                            + item.mglt
                            + "\n starshipClass: "
                            + item.starshipClass))),
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