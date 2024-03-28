import 'package:flutter/material.dart';
import 'package:movie_ui/src/datasource/tv_datasource.dart';
import 'package:movie_ui/src/models/tv_models.dart';
import 'package:movie_ui/src/repositories/tv_repository.dart';

class TvProvider with ChangeNotifier {
  final TvRepository _repository = TvRepository(TvDataSource());

  List<TV> _tv = [];
  List<TV> get tv => _tv;

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

  Future<void> fetchTvProv() async {
    _isLoading = true;
    try {
      _tv = await _repository.fetchTv();
      _isFetched = true;
    } catch (error) {
      throw Exception('Failed to fetch tv: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
