import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_ui/src/settings/app_setting.dart';
import '../models/movie_models.dart';

class PopularDataSource {
  Future<List<Movie>> fetchMovies() async {
    final Uri uri = Uri.parse(AppSetting().baseUrlPopular);

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer ${AppSetting().token}',
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
