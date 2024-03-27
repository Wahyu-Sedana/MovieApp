import 'package:flutter/material.dart';
import '../datasource/popular_datasource.dart';
import '../repositories/popular_repository.dart';
import '../models/movie_models.dart';

class PopularProvider extends ChangeNotifier {
  final PopularRepository _repository = PopularRepository(PopularDataSource());

  List<Movie> _popular = [];
  List<Movie> get popular => _popular;

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

  Future<void> fetchPopular() async {
    _isLoading = true;
    try {
      _popular = await _repository.fetchPopular();
      _isFetched = true;
    } catch (error) {
      throw Exception('Failed to fetch popular movies: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
