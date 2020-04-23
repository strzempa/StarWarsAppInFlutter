import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Models/Starships.dart';
import '../Models/Films.dart';
import '../Models/People.dart';
import '../Models/Planets.dart';
import '../Models/Species.dart';
import '../Models/Vehicles.dart';
import 'Endpoints.dart';
import 'Service.dart';

Future<Films> fetchFilms() async {
  final response = await http.get(baseUrl + '/' + Endpoint.films.toShortString());
  if (response.statusCode < 400) {
    return Films.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to fetch Films');
  }
}

Future<People> fetchPeople() async {
  final response = await http.get(baseUrl + '/' + Endpoint.people.toShortString());
  if (response.statusCode < 400) {
    return People.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to fetch People');
  }
}

Future<Planets> fetchPlanets() async {
  final response = await http.get(baseUrl + '/' + Endpoint.planets.toShortString());
  if (response.statusCode < 400) {
    return Planets.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to fetch Planets');
  }
}

Future<Species> fetchSpecies() async {
  final response = await http.get(baseUrl + '/' + Endpoint.species.toShortString());
  if (response.statusCode < 400) {
    return Species.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to fetch Species');
  }
}

Future<Vehicles> fetchVehicles() async {
  final response = await http.get(baseUrl + '/' + Endpoint.vehicles.toShortString());
  if (response.statusCode < 400) {
    return Vehicles.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to fetch Vehicles');
  }
}

Future<Starships> fetchStarships() async {
  final response = await http.get(baseUrl + '/' + Endpoint.starships.toShortString());
  if (response.statusCode < 400) {
    return Starships.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to fetch Starships');
  }
}
