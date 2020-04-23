import 'package:flutter/material.dart';
import '../Scenes/StarshipsList.dart';
import '../Scenes/FilmsList.dart';
import '../Scenes/PeopleList.dart';
import '../Scenes/PlanetsList.dart';
import '../Scenes/SpeciesList.dart';
import '../Scenes/VehiclesList.dart';

enum Endpoint { films, people, planets, species, starships, vehicles }

extension ParseToString on Endpoint {
  String toShortString() {
    return this.toString().split('.').last;
  }
}

extension Route on Endpoint {
  StatefulWidget route() {
    switch(this) {
    case Endpoint.films: {
       return FilmsList(title: this.toShortString());
    }
    break;

    case Endpoint.people: {
       return PeopleList(title: this.toShortString());
    }
    break;

    case Endpoint.planets: {
       return PlanetsList(title: this.toShortString());
    }
    break;

    case Endpoint.species: {
       return SpeciesList(title: this.toShortString());
    }
    break;

   case Endpoint.starships: {
      return StarshipsList(title: this.toShortString());
   }
   break;

   case Endpoint.vehicles: {
      return VehiclesList(title: this.toShortString());
   }
   break;

   default: {
      return StarshipsList(title: this.toShortString());
   }
   break;
}
  }
}
