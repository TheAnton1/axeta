import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({
    required this.latitude,
    required this.longitude,
    super.key,
  });

  final double latitude;
  final double longitude;

  @override
  Widget build(BuildContext context) {
    return OSMFlutter(
      controller: SimpleMapController(
        initPosition: GeoPoint(latitude: latitude, longitude: longitude),
        markerHome: const MarkerIcon(
          icon: Icon(Icons.home),
        ),
      ),
      osmOption: const OSMOption(
        zoomOption: ZoomOption(
          initZoom: 10
        )
      ),
    );
  }
}
