import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_ui/src/models/toprated_models.dart';
import 'package:movie_ui/src/settings/app_setting.dart';

import '../models/tv_models.dart';

class TvDataSource {
  Future<List<TV>> fetchTvData() async {
    final Uri uri = Uri.parse(AppSetting().baseUrlTv);

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer ${AppSetting().token}',
      },
    );
    if (response.statusCode == 200) {
      final List<TV> tv = [];
      final decodedData = jsonDecode(response.body);
      for (final tvData in decodedData['results']) {
        final tvk = TV.fromJson(tvData);
        tv.add(tvk);
      }
      return tv;
    } else {
      throw Exception('Failed to load Tv');
    }
  }
}
