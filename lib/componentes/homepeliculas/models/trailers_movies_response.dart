// To parse this JSON data, do
//
//     final trailersMoviesResponse = trailersMoviesResponseFromMap(jsonString);

import 'dart:convert';

import 'package:pnetflix/componentes/homepeliculas/models/trailer.dart';

class TrailersMoviesResponse {
    TrailersMoviesResponse({
        required this.id,
        required this.results,
    });

    int id;
    List<Result> results;

    factory TrailersMoviesResponse.fromJson(String str) => TrailersMoviesResponse.fromMap(json.decode(str));

  
    factory TrailersMoviesResponse.fromMap(Map<String, dynamic> json) => TrailersMoviesResponse(
        id: json["id"],
        results: List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
    );

}

