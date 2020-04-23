import 'package:flutter/material.dart';
import '../Extensions/Color+HexColor.dart';
import '../Services/StarWarsFutures.dart';
import '../Models/Vehicles.dart';

class VehiclesList extends StatefulWidget {
  VehiclesList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _VehiclesState createState() => _VehiclesState();
}

class _VehiclesState extends State<VehiclesList> {
  Future<Vehicles> fetch;

  @override
  void initState() {
    super.initState();
    fetch = fetchVehicles();
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
          child: FutureBuilder<Vehicles>(
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
                        color: HexColor("#ED1B24"),
                        child: Center(child: Text('${item.name}',
                                                  style: TextStyle(color: HexColor("#FFC30D")))),
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
                            + "\n vehicleClass: "
                            + item.vehicleClass))),
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
