import 'package:flutter/material.dart';
import '/models/Movie.dart';
import '/services/MoviesApiService.dart';

class MoviesListViewModel extends ChangeNotifier {
  final MoviesApiService _apiService = MoviesApiService();

  Future<List<Movie>> fetchMovies() async {
    try {
      return await _apiService.fetchMovies();
    } catch (e) {
      throw e;
    }
  }
}
