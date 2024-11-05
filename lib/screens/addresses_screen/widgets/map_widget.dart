import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sloykabakery/screens/addresses_screen/addresses_screen.dart';

class MapWidget extends ConsumerWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final markers = ref.watch(markersProvider);
    return SizedBox(
      width: double.infinity,
      height: 500,
      child: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(59.937500, 30.308611),
          initialZoom: 12,
          maxZoom: 19,
        ),
        children: [
          openStreetMapTilelayer,
          MarkerLayer(markers: markers),
        ],
      ),
    );
  }
}

TileLayer get openStreetMapTilelayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'flutter_application_3',
      tileSize: 256,
      maxZoom: 20,
      maxNativeZoom: 20,
    );
