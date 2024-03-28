import 'package:movie_ui/src/datasource/toprated_datasource.dart';
import 'package:movie_ui/src/datasource/tv_datasource.dart';
import '../models/tv_models.dart';

class TvRepository {
  final TvDataSource _dataSource;

  TvRepository(this._dataSource);

  Future<List<TV>> fetchTv() async {
    try {
      return await _dataSource.fetchTvData();
    } catch (error) {
      throw Exception('Failed to fetch TV shows: $error');
    }
  }
}
