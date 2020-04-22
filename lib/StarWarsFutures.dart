import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'MainView.dart';
import 'Models/Starships.dart';

String baseUrl = "https://swapi.dev/api";

enum Endpoint { starships }

extension ParseToString on Endpoint {
  String toShortString() {
    return this.toString().split('.').last;
  }
}

Future<Starships> fetch() async {
  final response = await http.get(baseUrl + '/' + Endpoint.starships.toShortString());
  if (response.statusCode < 400) {
    return Starships.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to fetch Starships');
  }
}
