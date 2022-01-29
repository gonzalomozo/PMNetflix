// To parse this JSON data, do
//
//     final seriesSliderResponse = seriesSliderResponseFromMap(jsonString);

import 'dart:convert';

import 'package:pnetflix/componentes/homepeliculas/model/model.dart';

class SeriesSliderResponse {
    SeriesSliderResponse({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    int page;
    List<Serie> results;
    int totalPages;
    int totalResults;

    factory SeriesSliderResponse.fromJson(String str) => SeriesSliderResponse.fromMap(json.decode(str));

    factory SeriesSliderResponse.fromMap(Map<String, dynamic> json) => SeriesSliderResponse(
        page: json["page"],
        results: List<Serie>.from(json["results"].map((x) => Serie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

}
