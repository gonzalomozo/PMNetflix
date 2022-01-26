// To parse this JSON data, do
//
//     final trailersResponse = trailersResponseFromMap(jsonString);

import 'dart:convert';

class TrailersResponse {
    TrailersResponse({
        required this.id,
        required this.results,
    });

    int id;
    List<Result> results;

    factory TrailersResponse.fromJson(String str) => TrailersResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TrailersResponse.fromMap(Map<String, dynamic> json) => TrailersResponse(
        id: json["id"],
        results: List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
    };
}

class Result {
    Result({
        required this.iso6391,
        required this.iso31661,
        required this.name,
        required this.key,
        required this.site,
        required this.size,
        required this.type,
        required this.official,
        required this.publishedAt,
        required this.id,
    });

    String iso6391;
    String iso31661;
    String name;
    String key;
    String site;
    int size;
    String type;
    bool official;
    DateTime publishedAt;
    String id;

    factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Result.fromMap(Map<String, dynamic> json) => Result(
        iso6391: json["iso_639_1"],
        iso31661: json["iso_3166_1"],
        name: json["name"],
        key: json["key"],
        site: json["site"],
        size: json["size"],
        type: json["type"],
        official: json["official"],
        publishedAt: DateTime.parse(json["published_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toMap() => {
        "iso_639_1": iso6391,
        "iso_3166_1": iso31661,
        "name": name,
        "key": key,
        "site": site,
        "size": size,
        "type": type,
        "official": official,
        "published_at": publishedAt.toIso8601String(),
        "id": id,
    };
}
