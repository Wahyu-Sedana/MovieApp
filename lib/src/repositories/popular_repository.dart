import 'package:movie_ui/src/datasource/popular_datasource.dart';

import '../models/movie_models.dart';

class PopularRepository {
  final PopularDataSource _popularDataSource;

  PopularRepository(this._popularDataSource);

  Future<List<Movie>> fetchPopular() async {
    try {
      return await _popularDataSource.fetchMovies();
    } catch (error) {
      throw Exception('Failed to fetch TV shows: $error');
    }
  }
}
