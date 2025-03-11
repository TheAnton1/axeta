abstract class IGeoInfoRepository {
  Future<Map<String, double>?> getLocationByAddress(String address);
}