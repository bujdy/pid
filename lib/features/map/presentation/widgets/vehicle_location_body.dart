import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:pid/features/map/application/vehicle_location_bloc.dart';

class VehicleLocationBody extends StatefulWidget {
  const VehicleLocationBody({super.key});

  @override
  State<VehicleLocationBody> createState() => _VehicleLocationBodyState();
}

class _VehicleLocationBodyState extends State<VehicleLocationBody> {
  final mapController = MapController();
  var zoom = 18.0;

  var pragueCenter = LatLng(50.0755, 14.4378);

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VehicleLocationBloc, VehicleLocationState>(
        listener: (context, state) {
      if (state.currentLatLng != null) {
        mapController.move(state.currentLatLng!, zoom);
      }
    }, builder: (context, state) {
      return FlutterMap(
        mapController: mapController,
        options: MapOptions(
          initialCenter: pragueCenter,
          initialZoom: zoom,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'sk.bujdy.pid',
          ),
          MarkerLayer(
            markers: [
              if (state.currentLatLng != null)
                Marker(
                  point: state.currentLatLng!,
                  width: 40,
                  height: 40,
                  child: const Icon(
                    Icons.location_pin,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
            ],
          ),
        ],
      );
    });
  }
}
