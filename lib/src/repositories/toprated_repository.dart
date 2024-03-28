import 'package:movie_ui/src/datasource/toprated_datasource.dart';
import 'package:movie_ui/src/models/toprated_models.dart';

class TopRatedRepository {
  final TopRatedDataSource _topRatedDataSource;

  TopRatedRepository(this._topRatedDataSource);

  Future<List<TopRated>> fetchTopRated() async {
    try {
      return await _topRatedDataSource.fetchToprated();
    } catch (error) {
      throw Exception('Failed to fetch Top Rated shows: $error');
    }
  }
}
