import 'package:axeta/data_sources/geo_info/i_geo_info_api.dart';
import 'package:axeta/repositories/geo_info/i_geo_info_repository.dart';

class GeoInfoRepository implements IGeoInfoRepository {
  GeoInfoRepository({required this.geoInfoApi});

  final IGeoInfoApi geoInfoApi;

  @override
  Future<Map<String, double>?> getLocationByAddress(String address) async {
    return await geoInfoApi.getLocationByName(address);
  }
}