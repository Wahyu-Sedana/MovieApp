import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_ui/src/models/toprated_models.dart';
import 'package:movie_ui/src/settings/app_setting.dart';

class TopRatedDataSource {
  Future<List<TopRated>> fetchToprated() async {
    final Uri uri = Uri.parse(AppSetting().baseUrlTopRated);

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer ${AppSetting().token}',
      },
    );
    if (response.statusCode == 200) {
      final List<TopRated> topRates = [];
      final decodedData = jsonDecode(response.body);
      for (final topRatedData in decodedData['results']) {
        final topRated = TopRated.fromJson(topRatedData);
        topRates.add(topRated);
      }
      return topRates;
    } else {
      throw Exception('Failed to load Top Rate');
    }
  }
}
