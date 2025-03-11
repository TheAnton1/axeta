import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:axeta/data_sources/geo_info/i_geo_info_api.dart';

class GeoInfoApi implements IGeoInfoApi {
  @override
  Future<Map<String, double>?> getLocationByName(String address) async {
    final url = Uri.parse(
        'https://nominatim.openstreetmap.org/search?q=$address&format=json&limit=1');

    final response = await http
        .get(url, headers: {'User-Agent': 'Axeta/1.0 (123@gmail.com)'});

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      if (data.isNotEmpty) {
        final result = data[0];
        return {
          'lat': double.parse(result['lat']),
          'lon': double.parse(result['lon']),
        };
      }
    }
    return null;
  }
}
