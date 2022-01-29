// To parse this JSON data, do
//
//     final similarMovieResponse = similarMovieResponseFromMap(jsonString);

import 'dart:convert';

import 'package:pnetflix/componentes/homepeliculas/models/models.dart';

class SimilarMovieResponse {
    SimilarMovieResponse({
        
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });
    
    int page;
    List<Movie> results;
    int totalPages;
    int totalResults;

    factory SimilarMovieResponse.fromJson(String str) => SimilarMovieResponse.fromMap(json.decode(str));

    factory SimilarMovieResponse.fromMap(Map<String, dynamic> json) => SimilarMovieResponse(
       
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

}


