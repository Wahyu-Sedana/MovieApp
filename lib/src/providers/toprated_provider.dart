import 'package:flutter/material.dart';
import 'package:movie_ui/src/datasource/toprated_datasource.dart';
import 'package:movie_ui/src/models/toprated_models.dart';
import 'package:movie_ui/src/repositories/toprated_repository.dart';

class TopRatedProvider with ChangeNotifier {
  final TopRatedRepository _repository = TopRatedRepository(TopRatedDataSource());

  List<TopRated> _topRate = [];
  List<TopRated> get topRate => _topRate;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isFetched = false;
  bool get isFetched => _isFetched;

  bool _isExpanded = false;
  bool get isExpanded => _isExpanded;

  void toggleExpandedState() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }

  Future<void> fetchTop() async {
    _isLoading = true;
    try {
      _topRate = await _repository.fetchTopRated();
      _isFetched = true;
    } catch (error) {
      throw Exception('Failed to fetch top rate movies: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
