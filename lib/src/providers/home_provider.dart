import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/movie_models.dart';

class HomeProvider with ChangeNotifier {
  final String apiKey = '4f2ce656a9d211cf2a9160a68b0a11d4';
  final String token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZjJjZTY1NmE5ZDIxMWNmMmE5MTYwYTY4YjBhMTFkNCIsInN1YiI6IjYxYmM3ZmU3MjIzZTIwMDA5MDEwYmEzYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.IJN4ACnQkAUuTmQJ191f-5Oic9PIE8yw811Gc6BFN8Q';

  Future<List<Movie>> fetchMovies() async {
    final Uri uri = Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=en-US&page=1');

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final List<Movie> movies = [];
      final decodedData = jsonDecode(response.body);
      for (final movieData in decodedData['results']) {
        final movie = Movie.fromJson(movieData);
        movies.add(movie);
      }
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
