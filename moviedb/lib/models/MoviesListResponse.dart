// To parse this JSON data, do
//
//     final moviesListResponse = moviesListResponseFromJson(jsonString);

import 'dart:convert';

import 'package:themoviedb/models/Movie.dart';

MoviesListResponse moviesListResponseFromJson(String str) =>
    MoviesListResponse.fromJson(json.decode(str));

String moviesListResponseToJson(MoviesListResponse data) =>
    json.encode(data.toJson());

class MoviesListResponse {
  int? page;
  List<Movie>? results;
  int? totalPages;
  int? totalResults;

  MoviesListResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory MoviesListResponse.fromJson(Map<String, dynamic> json) =>
      MoviesListResponse(
        page: json["page"],
        results:
            List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}
