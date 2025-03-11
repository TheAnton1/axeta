abstract class IGeoInfoApi {
  Future<Map<String, double>?> getLocationByName(String address);
}
